#pragma once

#include <nusys.h>
#include "gfx.h"

#define MAX_GFX_TASKS 2

// Globals defined in gfx_statics.c
extern GfxTask gfx_tasks[MAX_GFX_TASKS];
extern int current_task;
extern Gfx gfx_setup_rdpstate[];
extern Gfx gfx_setup_rspstate[];

// Task helpers
static inline GfxTask *gfx_get_task(int i) {
    return &gfx_tasks[i];
}

static inline Gfx *gfx_task_display_list(GfxTask *task) {
    return &task->display_list[0];
}

// Physical address helpers (wraps OS_K0_TO_PHYSICAL macro)
static inline u32 gfx_rspstate_phys(void) {
    return (u32)OS_K0_TO_PHYSICAL(gfx_setup_rspstate);
}

static inline u32 gfx_rdpstate_phys(void) {
    return (u32)OS_K0_TO_PHYSICAL(gfx_setup_rdpstate);
}

static inline u32 gfx_zbuffer_phys(void) {
    return (u32)OS_K0_TO_PHYSICAL(nuGfxZBuffer);
}

static inline u32 gfx_cfb_phys(void) {
    return (u32)osVirtualToPhysical(nuGfxCfb_ptr);
}

// Precomputed fill colors
static inline u32 gfx_zbuffer_fill_color(void) {
    return (GPACK_ZDZ(G_MAXFBZ, 0) << 16 | GPACK_ZDZ(G_MAXFBZ, 0));
}

static inline u32 gfx_cfb_fill_color(void) {
    return (GPACK_RGBA5551(0, 0, 0, 1) << 16 | GPACK_RGBA5551(0, 0, 0, 1));
}

// Display list command wrappers (each advances gfx_list_ptr)
static inline void dl_sp_segment(int seg, u32 base) {
    gSPSegment(gfx_list_ptr++, seg, base);
}

static inline void dl_sp_display_list(u32 addr) {
    gSPDisplayList(gfx_list_ptr++, addr);
}

static inline void dl_dp_set_depth_image(u32 img) {
    gDPSetDepthImage(gfx_list_ptr++, img);
}

static inline void dl_dp_set_cycle_type(int type) {
    gDPSetCycleType(gfx_list_ptr++, type);
}

static inline void dl_dp_set_color_image(int fmt, int siz, int width, u32 img) {
    gDPSetColorImage(gfx_list_ptr++, fmt, siz, width, img);
}

static inline void dl_dp_set_fill_color(u32 color) {
    gDPSetFillColor(gfx_list_ptr++, color);
}

static inline void dl_dp_fill_rectangle(int x0, int y0, int x1, int y1) {
    gDPFillRectangle(gfx_list_ptr++, x0, y0, x1, y1);
}

static inline void dl_dp_pipe_sync(void) {
    gDPPipeSync(gfx_list_ptr++);
}
