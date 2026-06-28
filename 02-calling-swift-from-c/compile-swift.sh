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

# Create build directory
mkdir -p "$BUILD_DIR"

echo "Compiling Swift code with host compiler..."
echo "Swift compiler: $SWIFTC"
echo "Build directory: $BUILD_DIR"
echo "Target: mipsel-none-none-elf"

# Try to compile with embedded Swift mode
"$SWIFTC" \
    -target mipsel-none-none-elf \
    -enable-experimental-feature Embedded \
    -O -wmo \
    -parse-as-library \
    -emit-object \
    -module-name SwiftLib \
    -o "$BUILD_DIR/swiftlib.o" \
    src/lib.swift 2>&1 || echo "Swift compilation failed, check error above"

# Check if object file was created
if [ -f "$BUILD_DIR/swiftlib.o" ]; then
    echo "✓ Swift compilation successful: $BUILD_DIR/swiftlib.o"
    file "$BUILD_DIR/swiftlib.o"
else
    echo "✗ Swift compilation failed"
fi