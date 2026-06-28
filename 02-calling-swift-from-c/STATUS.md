# Swift on Nintendo 64 - Example 02: Calling Swift from C

This directory contains an attempt to replicate the `02-calling-rust-from-c` example from the n64-heart-rust project using embedded Swift.

## Current Status

**Work in Progress** - This example is a proof of concept and requires additional setup.

## Requirements

To build this example, you need:

1. **N64 Toolchain**: Modern SDK (mips-n64-gcc, mips-n64-ld, etc.)
2. **Swift Embedded**: Custom Swift toolchain built from source
3. **N64 Libraries**: libdragon, libultra, etc.

## Approach

The example follows the same pattern as the Rust version:

1. **C Code** (`src/main.c`): Main program that calls Swift code
2. **Swift Code** (`src/lib.swift`): Swift function callable from C
3. **Assembly** (`asm/`): Entry point and ROM header
4. **Linker Script** (`calling-swift-from-c.ld`): Combines all sections

## Key Differences from Rust

### Swift Function Definition

```swift
// src/lib.swift
@_cdecl
public func call_swift() -> CInt {
    return 1
}
```

The `@_cdecl` attribute ensures C calling convention, and `CInt` matches the C `int` type.

### C Declaration

```c
// src/main.c
int call_swift();
```

### Compilation

Swift compilation uses the embedded toolchain:

```bash
swiftc -target mips-none-none-elf -O -parse-as-library \
      -emit-object -L<path/to/swift/lib> -o build/swiftlib.o src/lib.swift
```

## Build System

The `GNUmakefile` handles:
- C compilation with MIPS toolchain
- Swift compilation with embedded toolchain  
- Assembly with MIPS assembler
- Linking with MIPS linker
- ROM generation with objcopy and makemask

## Linker Script

The linker script (`calling-swift-from-c.ld`) includes:
- Swift object file sections (.text, .data, .rodata, .bss)
- Swift runtime libraries (libswiftEmbedded.a)
- C object files and standard N64 libraries

## Challenges

1. **Toolchain Compatibility**: Swift toolchain targets `mips-none-none-elf` while N64 uses `mips-n64-elf`
2. **Calling Convention**: Need to ensure Swift uses correct MIPS o32 ABI
3. **Runtime**: Swift runtime must be linked and initialized properly
4. **Memory Layout**: Swift runtime expects certain memory layout that may not match N64

## Next Steps

To make this work:

1. Build/configure MIPS toolchain for N64 development
2. Configure Swift target specification for N64 (similar to Rust's `mips-nintendo64-elf.json`)
3. Implement Swift runtime initialization for bare-metal N64
4. Test and debug calling conventions
5. Add Swift standard library functions needed for embedded use

## References

- n64-heart-rust: https://github.com/n64-heart/n64-heart-rust
- Swift Embedded: https://github.com/apple/swift
- Modern SDK: https://crashoveride95.github.io/modernsdk/