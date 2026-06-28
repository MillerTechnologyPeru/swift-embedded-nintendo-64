#!/bin/bash

# Swift compilation script - runs on host system
# Called from Docker container or directly

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

# Build Swift object file using host compiler
SWIFTC="${SWIFTC:-/Volumes/Crucial-2TB/Developer/build/Ninja-ReleaseAssert/swift-macosx-arm64/bin/swiftc}"
BUILD_DIR="${BUILD_DIR:-build}"
SWIFT_DIR="/Volumes/Crucial-2TB/Developer/build/Ninja-ReleaseAssert/swift-macosx-arm64"

# Check if running in Docker (different Swift path)
if [ -f "/swift-host/bin/swiftc" ]; then
    SWIFTC="/swift-host/bin/swiftc"
    SWIFT_DIR="/swift-host"
fi

# Create build directory
mkdir -p "$BUILD_DIR"

echo "Compiling Swift code with host compiler..."
echo "Swift compiler: $SWIFTC"
echo "Build directory: $BUILD_DIR"
echo "Target: mips-none-none-elf"

# Try to compile with embedded Swift mode + additional flags
"$SWIFTC" \
    -target mips-none-none-elf \
    -enable-experimental-feature Embedded \
    -O -wmo \
    -parse-as-library \
    -emit-object \
    -module-name SwiftLib \
    -Xlinker --no-relax \
    -Xlinker --static \
    -Xlinker --no-dynamic-linker \
    -Xcc -fno-stack-protector \
    -Xcc -fno-PIC \
    -Xcc -fno-PIC \
    -Xcc -fno-pie \
    -Xcc -mno-abicalls \
    -Xcc -G0 \
    -Xcc -mips3 \
    -o "$BUILD_DIR/swiftlib.o" \
    src/lib.swift 2>&1 || echo "Swift compilation failed, check error above"

# Check if object file was created
if [ -f "$BUILD_DIR/swiftlib.o" ]; then
    echo "✓ Swift compilation successful: $BUILD_DIR/swiftlib.o"
    file "$BUILD_DIR/swiftlib.o"
    objdump -h "$BUILD_DIR/swiftlib.o" | head -10
else
    echo "✗ Swift compilation failed"
fi