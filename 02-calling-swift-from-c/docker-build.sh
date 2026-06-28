#!/bin/bash

# Build N64 ROM: Swift on host, C/linking in Docker
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

IMAGE_NAME="n64-swift-sdk"
CONTAINER_NAME="n64-swift-builder"

echo "Step 1: Compiling Swift on host system..."
./compile-swift.sh

if [ ! -f "build/swiftlib.o" ]; then
    echo "Swift compilation failed"
    exit 1
fi

echo "Step 2: Building Docker image with N64 SDK..."
docker build --platform linux/amd64 -t "$IMAGE_NAME" -f Dockerfile .

echo "Step 3: Compiling C code and linking in Docker..."
# Remove stale ELF from previous failed builds so make relinks
rm -f build/calling-swift-from-c.elf build/calling-swift-from-c.map 2>/dev/null || true
mkdir -p build
docker run --rm --platform linux/amd64 \
    --name "$CONTAINER_NAME" \
    -v "$(pwd):/workspace" \
    -w /workspace \
    "$IMAGE_NAME" \
    make -f GNUmakefile SWIFT_OBJ_EXIST=1 VERBOSE=1

echo "Build complete!"
if [ -f "build/calling-swift-from-c.z64" ]; then
    echo "ROM file created: build/calling-swift-from-c.z64"
    ls -lh build/calling-swift-from-c.z64
fi