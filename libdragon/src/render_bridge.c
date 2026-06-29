// libdragon-side implementation of the Swift drawing bridge.
// Compiled by the libdragon mips64-elf GCC, so it can see libdragon's headers
// and use color_t / the rdpq macros that don't cross into Swift.

#include <libdragon.h>
#include "render_bridge.h"

void bridge_begin_fill(void) {
    rdpq_set_mode_fill(RGBA32(0, 0, 0, 255));
}

void bridge_fill_rect(uint32_t rgba, uint32_t p0, uint32_t p1) {
    uint8_t r = (rgba >> 24) & 0xFF;
    uint8_t g = (rgba >> 16) & 0xFF;
    uint8_t b = (rgba >> 8) & 0xFF;
    uint8_t a = rgba & 0xFF;
    int x0 = (int)(p0 >> 16), y0 = (int)(p0 & 0xFFFF);
    int x1 = (int)(p1 >> 16), y1 = (int)(p1 & 0xFFFF);
    rdpq_set_fill_color(RGBA32(r, g, b, a));
    rdpq_fill_rectangle(x0, y0, x1, y1);
}

int bridge_screen_width(void) {
    return display_get_width();
}

int bridge_screen_height(void) {
    return display_get_height();
}

int bridge_abs(int v) {
    return v < 0 ? -v : v;
}

uint8_t bridge_clamp(int v) {
    if (v < 0) return 0;
    if (v > 255) return 255;
    return (uint8_t)v;
}

int bridge_cell_edge(int x0, int cell_size, int total) {
    int edge = x0 + cell_size - 1;
    return edge < total ? edge : total - 1;
}
