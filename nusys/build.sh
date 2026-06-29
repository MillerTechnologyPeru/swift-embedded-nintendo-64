#!/bin/bash

# Build script that compiles Swift on host, then uses Docker for C compilation
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

echo "Step 1: Compiling Swift on host system..."
./compile-swift.sh

if [ ! -f "build/swiftlib.o" ]; then
    echo "❌ Swift compilation failed"
    exit 1
fi

echo "✅ Swift compilation successful"

echo "Step 2: Building Docker image..."
docker build -t n64-swift-sdk -f Dockerfile . 2>&1 | grep -E "Successfully|already exists|Step|Error" || echo "Docker build complete"

echo "Step 3: Compiling C code and linking in Docker..."
docker run --rm --platform linux/amd64 \
    -v "$(pwd):/workspace" \
    -w /workspace \
    n64-swift-sdk \
    make -f GNUmakefile SWIFT_OBJ_EXIST=1

echo "✅ Build complete!"
if [ -f "build/calling-swift-from-c.z64" ]; then
    echo "🎮 ROM file created: build/calling-swift-from-c.z64"
    ls -lh build/calling-swift-from-c.z64
fi

echo "✅ Swift compilation successful"

echo "Step 2: Building Docker image..."
docker build -t n64-swift-sdk -f Dockerfile . >/dev/null 2>&1

echo "Step 3: Compiling C code and linking in Docker..."
docker run --rm --platform linux/amd64 \
    -v "$(pwd):/workspace" \
    -w /workspace \
    n64-swift-sdk \
    make -f GNUmakefile SWIFT_OBJ_EXIST=1

echo "✅ Build complete!"
if [ -f "build/calling-swift-from-c.z64" ]; then
    echo "🎮 ROM file created: build/calling-swift-from-c.z64"
    ls -lh build/calling-swift-from-c.z64
fi