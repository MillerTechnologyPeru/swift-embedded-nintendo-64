#pragma once

// Minimal bridging header shared between Swift and the libdragon C side.
//
// Swift imports ONLY this header (via -import-objc-header), not libdragon's
// headers — so the host swiftc/clang importer never has to parse libdragon.
// The wrappers below are implemented in render_bridge.c (compiled by the
// libdragon mips64-elf GCC) and forward to libdragon's rdpq/display API.
//
// All arguments are plain integers: floats are deliberately avoided across the
// Swift<->C boundary because LLVM (swiftc) and the N64 GCC disagree on the
// float-argument ABI under o32.

#include <stdint.h>

// Begin a fill-mode render pass on the currently attached surface.
void bridge_begin_fill(void);

// Fill an axis-aligned rectangle with an opaque RGB color.
//
// Arguments are packed so the call uses at most 4 register arguments and no
// stack arguments: the Swift object is o32 (4-byte stack slots) while libdragon
// is o64 (8-byte stack slots), so any stack-passed argument would be read at
// the wrong offset. Keeping every bridge call to <=4 register args sidesteps
// that mismatch entirely.
//   rgba: (r<<24) | (g<<16) | (b<<8) | a
//   p0:   (x0<<16) | y0
//   p1:   (x1<<16) | y1
void bridge_fill_rect(uint32_t rgba, uint32_t p0, uint32_t p1);

// Dimensions of the attached display surface.
int bridge_screen_width(void);
int bridge_screen_height(void);

// Implemented in Swift (render.swift); called once per frame from main.c.
void swift_render(uint32_t frame);
