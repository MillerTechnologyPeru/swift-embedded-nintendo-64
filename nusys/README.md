# Swift on Nintendo 64 - Example 02: Calling Swift from C

This directory contains a successful Swift equivalent of the `02-calling-rust-from-c` example from the n64-heart-rust project.

## Status

✅ **Swift compilation successful!** - Swift code now compiles to MIPS object files using embedded Swift mode.

## How It Works

### Swift Code (src/lib.swift)

```swift
@_cdecl("call_swift")
public func call_swift() -> CInt {
    return 1
}
```

The `@_cdecl` attribute ensures C calling convention, and `CInt` matches the C `int` type.

### Swift Compilation

Swift compilation uses the experimental embedded Swift feature:

```bash
swiftc -target mipsel-none-none-elf \
       -enable-experimental-feature Embedded \
       -O -wmo \
       -parse-as-library \
       -emit-object \
       -o build/swiftlib.o \
       src/lib.swift
```

**Key points:**
- `-target mipsel-none-none-elf`: MIPS little-endian target
- `-enable-experimental-feature Embedded`: Enables embedded Swift mode
- `-wmo`: Whole Module Optimization (required for embedded Swift)
- `-parse-as-library`: Treat as a library module

### Build System

The project uses a hybrid approach:
- **Docker**: N64 C toolchain (gcc-mips-n64, binutils, n64sdk)
- **Host**: Custom Swift compiler with embedded Swift support

## Building

### Using Docker Compose (Recommended)

```bash
docker-compose up
```

### Using Docker Build Script

```bash
./docker-build.sh
```

### Manual Docker Command

```bash
docker run --rm \
    -v "$(pwd):/workspace" \
    -w /workspace \
    -v /Volumes/Crucial-2TB/Developer/build/Ninja-ReleaseAssert/swift-macosx-arm64:/swift-host:ro \
    n64-swift-sdk \
    make HOST_SWIFT=1 SWIFTC_HOST=/swift-host/bin/swiftc
```

## Verification

The Swift object file compiles successfully:

```bash
$ file build/swiftlib.o
build/swiftlib.o: ELF 32-bit LSB relocatable, MIPS, MIPS32 rel2 version 1 (GNU/Linux)

$ objdump -t build/swiftlib.o | grep call_swift
00000028 l     F .text  00000028 .protected $e8swiftlib10call_swifts5Int32VyF
00000000 g     F .text  00000028 .protected call_swift
```

The `call_swift` symbol is exported globally and can be called from C.

## Toolchain Requirements

### Docker (N64 C Toolchain)
- gcc-mips-n64
- binutils-mips-n64
- n64sdk
- libnusys, libultra, etc.

### Host (Swift Embedded Toolchain)
- Swift compiler with embedded support (6.5-dev or later)
- `-enable-experimental-feature Embedded` capability
- MIPS embedded Swift libraries

## Challenges Overcome

1. **Swift target specification**: Use `mipsel-none-none-elf` instead of `mips-none-none-elf`
2. **Embedded mode requirement**: Must use `-enable-experimental-feature Embedded`
3. **Whole Module Optimization**: Required for embedded Swift, add `-wmo` flag
4. **C calling convention**: Use `@_cdecl("func_name")` syntax
5. **Swift library linking**: Use embedded Swift runtime libraries

## Next Steps

1. Test complete build with Docker C toolchain
2. Generate N64 ROM file
3. Test on N64 hardware/emulator
4. Add more complex Swift examples

## References

- n64-heart-rust: https://github.com/n64-heart/n64-heart-rust
- Swift Embedded: https://github.com/apple/swift
- Modern SDK: https://crashoveride95.github.io/modernsdk/