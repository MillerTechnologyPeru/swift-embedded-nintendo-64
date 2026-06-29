#!/bin/bash

# Build the libdragon + Swift example.
#   1. Compile Swift to a MIPS object on the host.
#   2. Build the libdragon toolchain+library Docker image (cached after first run).
#   3. Compile the C side and link the ROM inside the container.

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

echo "Step 2: Building libdragon Docker image (first run builds libdragon, ~several minutes)..."
docker build --platform linux/amd64 -t libdragon-swift -f Dockerfile .

echo "Step 3: Compiling C and linking ROM in Docker..."
docker run --rm --platform linux/amd64 \
    -v "$(pwd):/workspace" \
    -w /workspace \
    libdragon-swift \
    make

echo "✅ Build complete!"
if [ -f "libdragon-swift.z64" ]; then
    echo "🎮 ROM file created: libdragon-swift.z64"
    ls -lh libdragon-swift.z64
fi
