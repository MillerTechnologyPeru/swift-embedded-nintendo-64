#!/bin/bash

# Compile the Swift sources to a MIPS object on the host, the same way as
# example 02: emit LLVM IR with embedded Swift, then lower with llc using a
# non-abicalls big-endian MIPS configuration that the N64 linker accepts.
#
# Swift only imports src/render_bridge.h (plain stdint declarations), so unlike
# example 02 we do NOT need libdragon's headers on the host.

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

SWIFTC="${SWIFTC:-/Volumes/Crucial-2TB/Developer/build/Ninja-ReleaseAssert/swift-macosx-arm64/bin/swiftc}"
LLC="${LLC:-/Volumes/Crucial-2TB/Developer/build/Ninja-ReleaseAssert/llvm-macosx-arm64/bin/llc}"
BUILD_DIR="${BUILD_DIR:-build}"

mkdir -p "$BUILD_DIR"

echo "Compiling Swift code with host compiler..."
echo "Swift compiler: $SWIFTC"
echo "Target: mips-none-none-elf"

# Step 1: Emit LLVM IR from Swift
echo "Step 1: Emitting LLVM IR..."
"$SWIFTC" \
    -target mips-none-none-elf \
    -enable-experimental-feature Embedded \
    -O -wmo \
    -parse-as-library \
    -import-objc-header src/render_bridge.h \
    -emit-ir \
    -module-name SwiftLib \
    -o "$BUILD_DIR/swiftlib.ll" \
    src/render.swift 2>&1

if [ ! -f "$BUILD_DIR/swiftlib.ll" ]; then
    echo "Failed to emit LLVM IR"
    exit 1
fi

# Step 2: Lower IR to a non-abicalls MIPS object
echo "Step 2: Compiling IR to object file with llc (non-abicalls)..."
"$LLC" \
    -mtriple=mips-none-none-elf \
    -mcpu=mips32r2 \
    -mattr=+mips3,+noabicalls,+gp64,+fpxx,+nooddspreg \
    -relocation-model=static \
    -filetype=obj \
    -o "$BUILD_DIR/swiftlib.o" \
    "$BUILD_DIR/swiftlib.ll" 2>&1

if [ ! -f "$BUILD_DIR/swiftlib.o" ]; then
    echo "✗ Swift compilation failed"
    exit 1
fi

# Step 3: Retag the ELF ABI from O32 to O64.
#
# libdragon is built with -mabi=o64, but LLVM cannot emit the O64 ABI (it only
# supports o32/n32/n64), so the linker rejects the O32 Swift object. Our object
# is already compiled with +gp64 (64-bit registers), which is exactly what O64
# is — o32 calling convention with 64-bit registers — so the code is compatible;
# only the ELF e_flags disagree. We patch e_flags from 0x20001101 (mips3, o32,
# 32bitmode, noreorder) to 0x20002001 (mips3, o64, noreorder). All cross-ABI
# calls are kept to <=4 register arguments so the o32/o64 stack-slot-size
# difference never comes into play (see render_bridge.h).
echo "Step 3: Retagging ELF ABI O32 -> O64..."
python3 - "$BUILD_DIR/swiftlib.o" <<'PY'
import sys, struct
path = sys.argv[1]
with open(path, "r+b") as f:
    data = bytearray(f.read())
    assert data[:4] == b"\x7fELF", "not an ELF file"
    assert data[5] == 2, "expected big-endian (EI_DATA=2)"   # N64 is MSB
    # ELF32 e_flags is a 4-byte big-endian field at offset 0x24.
    off = 0x24
    flags = struct.unpack(">I", data[off:off+4])[0]
    new = (flags & ~0x00001100) | 0x00002000  # clear O32(0x1000)+32bitmode(0x100), set O64(0x2000)
    data[off:off+4] = struct.pack(">I", new)
    f.seek(0); f.write(data)
    print(f"  e_flags 0x{flags:08x} -> 0x{new:08x}")
PY

echo "✓ Swift compilation successful: $BUILD_DIR/swiftlib.o"
file "$BUILD_DIR/swiftlib.o"
