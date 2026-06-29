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

<img width="771" height="632" alt="Screenshot 2026-06-29 at 8 13 38 AM" src="https://github.com/user-attachments/assets/41544965-1622-4b85-8c34-dbf48723e6b0" />

### [libdragon/](libdragon/) — Swift + libdragon
Animated color grid using the open-source [libdragon](https://github.com/DragonMinded/libdragon)
SDK and its `n64.mk` build system — a completely different toolchain from the
NuSYS example. Swift drives libdragon's `rdpq` fill API; C owns libdragon init
and the frame loop.

<img width="767" height="628" alt="Screenshot 2026-06-29 at 8 12 53 AM" src="https://github.com/user-attachments/assets/b4d7aa60-f640-4029-8d5a-4bed68901197" />

## Cross-toolchain gotchas

Two hard constraints apply to all examples:

**1. No floats across the Swift↔C boundary.**
LLVM (swiftc) and N64 GCC disagree on the o32 float-argument ABI: LLVM passes
trailing floats after a pointer in FP registers (`$f13`/`$f14`); GCC expects
them in GPRs (`$a1`/`$a2`). Pass IEEE-754 bit patterns as `UInt32`/`u32` instead
and reinterpret with a union on the C side.

**2. ≤4 register arguments per Swift↔C bridge call (libdragon only).**
libdragon uses `-mabi=o64` (8-byte stack slots); the Swift object is o32
(4-byte stack slots). Arguments beyond the first four spill to the stack and
are read at the wrong offset. Pack multiple values into a single `uint32_t`
to stay within four registers.

### Conditional moves (movn/movz) — fixed by llc flags

By default, LLVM lowers Swift `if`/ternary/`min`/`max` on integers to `select`
IR, which the MIPS backend emits as `movn`/`movz` — MIPS IV instructions the
VR4300 does not have. Executing them raises a Reserved Instruction exception.

The fix is two llc `-mattr` flags that disable the MIPS IV conditional-move
subset inherited by MIPS32:

```
-mattr=+mips3,+noabicalls,+gp64,+fpxx,+nooddspreg,-mips4_32,-mips4_32r2
```

Both `compile-swift.sh` scripts already include these flags. With them, Swift
conditionals compile to branches and there are no restrictions on using
`if`/`else`, ternaries, `min`, `max`, or `abs` in Swift code.

## Building

Each example has its own `build.sh`. Requirements:

- A MIPS-enabled Embedded Swift toolchain (`swiftc` + `llc`) — the standard
  release toolchains do not include MIPS; you need a custom build or one that
  ships MIPS embedded Swift modules.
- Docker — for the N64 GCC toolchain and SDK (pulled automatically on first run).

```bash
cd nusys     && ./build.sh   # → build/calling-swift-from-c.z64
cd libdragon && ./build.sh   # → libdragon-swift.z64
```
