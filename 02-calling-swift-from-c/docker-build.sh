#!/bin/bash

# Build and run N64 Docker container for C compilation
# Swift compilation happens on the host system

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

IMAGE_NAME="n64-swift-sdk"
CONTAINER_NAME="n64-swift-builder"

echo "Building Docker image with N64 SDK..."
docker build -t "$IMAGE_NAME" -f Dockerfile .

echo "Running compilation in Docker container..."
docker run --rm \
    --name "$CONTAINER_NAME" \
    -v "$(pwd):/workspace" \
    -w /workspace \
    "$IMAGE_NAME" \
    make -f GNUmakefile HOST_SWIFT=1 SWIFTC_HOST="/Volumes/Crucial-2TB/Developer/build/Ninja-ReleaseAssert/swift-macosx-arm64/bin/swiftc"