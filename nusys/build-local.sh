#!/bin/bash

# Direct make for C compilation (no Docker needed if N64 SDK installed locally)

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

echo "Step 2: Compiling C code and linking..."

if command -v mips-n64-gcc >/dev/null 2>&1; then
    echo "Using local N64 SDK"
    make -f GNUmakefile SWIFT_OBJ_EXIST=1

    if [ -f "build/calling-swift-from-c.z64" ]; then
        echo "✅ Build complete!"
        echo "🎮 ROM file created: build/calling-swift-from-c.z64"
        ls -lh build/calling-swift-from-c.z64
    fi
else
    echo "❌ N64 SDK not found locally"
    echo "Please install N64 SDK or use Docker build"
fi