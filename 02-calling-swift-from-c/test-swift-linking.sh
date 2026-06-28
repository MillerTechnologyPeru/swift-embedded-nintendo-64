#!/bin/bash

# Test Swift linking to N64 environment

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

echo "Testing Swift object file properties..."
echo "========================================"

echo "1. Object file information:"
file build/swiftlib.o

echo -e "\n2. Swift exported symbols:"
objdump -t build/swiftlib.o | grep -E "call_swift|\.text"

echo -e "\n3. Swift sections:"
objdump -h build/swiftlib.o | grep -E "Name|text|data|bss"

echo -e "\n4. Swift relocations:"
objdump -r build/swiftlib.o | head -20

echo -e "\n5. Testing if Swift can be linked alone:"
docker run --rm --platform linux/amd64 \
  -v "$(pwd):/workspace" \
  -w /workspace \
  n64-swift-sdk:working \
  mips-n64-ld -r -o test_swift_link.o build/swiftlib.o 2>&1 | head -20

if [ -f "test_swift_link.o" ]; then
    echo "✓ Swift object can be linked"
    rm test_swift_link.o
else
    echo "✗ Swift object linking failed"
fi