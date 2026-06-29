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

# The host Swift compiler imports the N64 SDK bridging header (src/gfx_bridge.h),
# but the SDK headers only ship inside the Docker image. Extract them once into
# n64-headers/ so the host clang importer can find <nusys.h>, <ultra64.h>, etc.
N64_HEADERS_DIR="${N64_HEADERS_DIR:-n64-headers}"
if [ ! -f "$N64_HEADERS_DIR/nusys/nusys.h" ]; then
    echo "Extracting N64 SDK headers from Docker image into $N64_HEADERS_DIR..."
    docker build --platform linux/amd64 -t n64-swift-sdk -f Dockerfile . >/dev/null
    cid=$(docker create --platform linux/amd64 n64-swift-sdk)
    rm -rf "$N64_HEADERS_DIR"
    mkdir -p "$N64_HEADERS_DIR"
    docker cp "$cid":/usr/include/n64/. "$N64_HEADERS_DIR"/
    docker rm "$cid" >/dev/null
fi

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
    -import-objc-header src/gfx_bridge.h \
    -Xcc -In64-headers \
    -Xcc -In64-headers/PR \
    -Xcc -In64-headers/nustd \
    -Xcc -In64-headers/nusys \
    -Xcc -D_LANGUAGE_C \
    -Xcc -DF3DEX_GBI_2=1 \
    -Xcc -DN64 \
    -emit-ir \
    -module-name SwiftLib \
    -o "$BUILD_DIR/swiftlib.ll" \
    src/lib.swift src/gfx.swift src/stage0.swift 2>&1

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