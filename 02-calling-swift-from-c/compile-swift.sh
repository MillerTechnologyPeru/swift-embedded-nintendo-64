#!/bin/bash

# Swift compilation script - runs on host system
# Emits LLVM IR from Swift, then compiles with llc using non-abicalls MIPS

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

# Build Swift object file using host compiler
SWIFTC="${SWIFTC:-/Volumes/Crucial-2TB/Developer/build/Ninja-ReleaseAssert/swift-macosx-arm64/bin/swiftc}"
LLC="/Volumes/Crucial-2TB/Developer/build/Ninja-ReleaseAssert/llvm-macosx-arm64/bin/llc"
BUILD_DIR="${BUILD_DIR:-build}"

# Create build directory
mkdir -p "$BUILD_DIR"

echo "Compiling Swift code with host compiler..."
echo "Swift compiler: $SWIFTC"
echo "LLVM llc: $LLC"
echo "Build directory: $BUILD_DIR"
echo "Target: mips-none-none-elf"

# Step 1: Emit LLVM IR from Swift
echo "Step 1: Emitting LLVM IR..."
"$SWIFTC" \
    -target mips-none-none-elf \
    -enable-experimental-feature Embedded \
    -O -wmo \
    -parse-as-library \
    -emit-ir \
    -module-name SwiftLib \
    -o "$BUILD_DIR/swiftlib.ll" \
    src/lib.swift 2>&1

if [ ! -f "$BUILD_DIR/swiftlib.ll" ]; then
    echo "Failed to emit LLVM IR"
    exit 1
fi

echo "Step 2: Compiling IR to object file with llc (non-abicalls)..."
"$LLC" \
    -mtriple=mips-none-none-elf \
    -mcpu=mips32r2 \
    -mattr=+mips3,+noabicalls,+gp64,+fpxx,+nooddspreg \
    -relocation-model=static \
    -filetype=obj \
    -o "$BUILD_DIR/swiftlib.o" \
    "$BUILD_DIR/swiftlib.ll" 2>&1

# Check if object file was created
if [ -f "$BUILD_DIR/swiftlib.o" ]; then
    echo "✓ Swift compilation successful: $BUILD_DIR/swiftlib.o"
    file "$BUILD_DIR/swiftlib.o"
    objdump -h "$BUILD_DIR/swiftlib.o" | head -10
else
    echo "✗ Swift compilation failed"
    exit 1
fi