# Swift on Nintendo 64 - Example 03: Swift + libdragon

This example runs Embedded Swift on the N64 using the open-source
[libdragon](https://github.com/DragonMinded/libdragon) SDK and its `n64.mk`
build system — a different toolchain from example 02 (which used the proprietary
NuSYS / crashsdk).

The C side owns libdragon initialisation and the frame loop; each frame it hands
rendering off to Swift, which draws an animated grid of color cells using
libdragon's `rdpq` fill API.

## How it works

```
main.c (libdragon GCC) ── per frame ──► swift_render(frame)   (render.swift)
        │                                      │
        │ display_init / rdpq_attach           │ bridge_begin_fill()
        │ rdpq_detach_show                     │ bridge_fill_rect(...)  ─► rdpq
        ▼                                      ▼
   libdragon                          render_bridge.c (libdragon GCC)
```

| File | Compiled by | Role |
|------|-------------|------|
| `src/main.c` | libdragon GCC | libdragon init + frame loop, calls `swift_render` |
| `src/render.swift` | host swiftc | drawing logic (`@c @implementation func swift_render`) |
| `src/render_bridge.h` | both | minimal bridging header (plain `stdint` types only) |
| `src/render_bridge.c` | libdragon GCC | thin wrappers over libdragon `rdpq`/`display` |
| `src/swift_stubs.c` | libdragon GCC | `posix_memalign` / stack-protector shims for the Swift runtime |

Swift imports **only** `render_bridge.h`, so the host `swiftc`/clang importer
never has to parse libdragon's headers.

## The two cross-toolchain gotchas

### 1. O32 vs O64 ABI

libdragon builds with `-mabi=o64` (32-bit pointers, **64-bit registers**), but
LLVM can only emit `o32`/`n32`/`n64` — not `o64`. The linker rejects an O32
object against O64 libdragon.

The Swift object is already compiled with `+gp64` (64-bit registers), which is
exactly what O64 is: the o32 calling convention with 64-bit registers. So the
*code* is compatible — only the ELF `e_flags` disagree. `compile-swift.sh`
patches the flag word from `0x20001101` (o32, 32bitmode) to `0x20002001` (o64).

The one real calling-convention difference between o32 and o64 is **stack
argument slot size** (4 vs 8 bytes). To avoid it, every function crossing the
Swift↔C boundary takes **at most 4 register arguments and no stack arguments** —
`bridge_fill_rect` packs its color and two corners into 3 `uint32_t`s.

### 2. No floats across the boundary

As in example 02, floats are never passed across the Swift↔C boundary (LLVM and
the N64 GCC disagree on the float-argument ABI). All animation here is integer
math.

## Building

```bash
./build.sh
```

This:
1. Compiles Swift to a MIPS object on the host (`compile-swift.sh`) and retags
   it O64.
2. Builds the Docker image from `Dockerfile` — starts from the official
   `ghcr.io/dragonminded/libdragon` toolchain image and builds + installs the
   libdragon library into `$N64_INST` (first run only; ~a few minutes).
3. Compiles the C side and links `libdragon-swift.z64` inside the container via
   `make` (libdragon's `n64.mk`).

Output: `libdragon-swift.z64`, runnable in an N64 emulator (ares, etc.) or on
hardware.

## Requirements

- Docker (for the libdragon `mips64-elf` toolchain + library)
- A host Embedded Swift toolchain with the MIPS embedded runtime, and `llc`
  (paths set via `SWIFTC` / `LLC` env vars in `compile-swift.sh`)
