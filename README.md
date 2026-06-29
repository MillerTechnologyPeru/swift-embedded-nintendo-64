# swift-embedded-nintendo-64

Embedded Swift running on the Nintendo 64, targeting the VR4300 CPU (MIPS III).

Each example builds a working N64 ROM. The Swift code is compiled on the host
with a MIPS-enabled `swiftc`, lowered to a MIPS ELF object via `llc`, then
linked against C code compiled by the appropriate N64 GCC toolchain.

## Examples

### [nusys/](nusys/) — Calling Swift from C (NuSYS SDK)
3D rotating cube using the proprietary NuSYS / crashsdk toolchain. The graphics
pipeline (`gfx.swift`), scene stages (`stage0.swift`, `stage1.swift`), and
entry point (`lib.swift`) are all Swift. C handles static data and matrix math
that must call N64 SDK float functions.

Uses `@c @implementation` (Swift 6.3) to implement functions declared in C headers.

### [libdragon/](libdragon/) — Swift + libdragon
Animated color grid using the open-source [libdragon](https://github.com/DragonMinded/libdragon)
SDK and its `n64.mk` build system — a completely different toolchain from the
NuSYS example. Swift drives libdragon's `rdpq` fill API; C owns libdragon init,
the frame loop, and any logic containing conditionals.

## Cross-toolchain gotchas

Three hard constraints apply to all examples:

**1. No floats across the Swift↔C boundary.**
LLVM (swiftc) and N64 GCC disagree on the o32 float-argument ABI: LLVM passes
trailing floats after a pointer in FP registers (`$f13`/`$f14`); GCC expects
them in GPRs (`$a1`/`$a2`). Pass IEEE-754 bit patterns as `UInt32`/`u32` instead
and reinterpret with a union on the C side.

**2. No conditionals in Swift (for libdragon / MIPS III targets).**
LLVM lowers `if`/ternary/`min`/`max` to `select` IR, which the MIPS backend
emits as `movn`/`movz` — MIPS IV conditional-move instructions. The VR4300 is
MIPS III and raises a **Reserved Instruction exception** on these. Move any
branching logic to a C helper compiled by the N64 GCC (which targets `mips3`
and emits branches instead).

**3. ≤4 register arguments per Swift↔C bridge call (libdragon only).**
libdragon uses `-mabi=o64` (8-byte stack slots); the Swift object is o32
(4-byte stack slots). Arguments beyond the first four spill to the stack and
are read at the wrong offset. Pack multiple values into a single `uint32_t`
to stay within four registers.

## Building

Each example has its own `build.sh`. Requirements:

- A MIPS-enabled Embedded Swift toolchain (`swiftc` + `llc`) — the standard
  release toolchains do not include MIPS; you need a custom build or one that
  ships MIPS embedded Swift modules.
- Docker — for the N64 GCC toolchain and SDK (pulled automatically on first run).

```bash
cd nusys     && ./build.sh   # → build/callingswift.z64
cd libdragon && ./build.sh   # → libdragon-swift.z64
```
