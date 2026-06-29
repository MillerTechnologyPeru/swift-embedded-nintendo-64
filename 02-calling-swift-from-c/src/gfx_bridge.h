#pragma once

#include <nusys.h>
#include "gfx.h"
#include "stage0.h"
#include "stage1.h"

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

static inline void dl_dp_full_sync(void) {
    gDPFullSync(gfx_list_ptr++);
}

static inline void dl_sp_end_display_list(void) {
    gSPEndDisplayList(gfx_list_ptr++);
}

// Submit the current display list as a standard render task and swap buffers.
static inline void gfx_task_submit(GfxTask *task) {
    nuGfxTaskStart(
        task->display_list,
        (s32)(gfx_list_ptr - task->display_list) * sizeof(Gfx),
        NU_GFX_UCODE_F3DEX,
        NU_SC_SWAPBUFFER
    );
}

// ---------------------------------------------------------------------------
// stage1 helpers
// ---------------------------------------------------------------------------

// Matrix setup — defined in stage1_matrix.c (N64 GCC) to guarantee float ABI
// compatibility with the gu* library functions.
extern u16   stage1_setup_projection(GfxTask *task);
extern void  stage1_setup_modelview(GfxTask *task);
extern void  stage1_setup_object_transform(GfxTask *task, u32 roll_bits, u32 pitch_bits);

// Vertex data lives in C (stage1_data.c) so it keeps its 16-byte alignment
// for RCP DMA. This loads all 8 cube vertices into slots 0..7.
extern Vtx square_verts[];

static inline void dl_sp_vertex_square(void) {
    gSPVertex(gfx_list_ptr++, &square_verts[0], 8, 0);
}

// Matrix-stack accessors: return pointers into the task's matrix storage so
// the gu* functions can write into them directly from Swift.
static inline Mtx *gfx_task_projection(GfxTask *task) {
    return &task->projection;
}

static inline Mtx *gfx_task_modelview(GfxTask *task) {
    return &task->modelview;
}

static inline Mtx *gfx_task_object_transform(GfxTask *task, int i) {
    return &task->object_transforms[i];
}

// Load a matrix, converting its address to physical for the RCP. The three
// flag combos used by stage1 are baked into named wrappers so Swift doesn't
// need the G_MTX_* macro constants.
static inline void dl_sp_matrix_projection_load(Mtx *m) {
    gSPMatrix(gfx_list_ptr++, OS_K0_TO_PHYSICAL(m),
              G_MTX_PROJECTION | G_MTX_LOAD | G_MTX_NOPUSH);
}

static inline void dl_sp_matrix_modelview_load(Mtx *m) {
    gSPMatrix(gfx_list_ptr++, OS_K0_TO_PHYSICAL(m),
              G_MTX_MODELVIEW | G_MTX_NOPUSH | G_MTX_LOAD);
}

static inline void dl_sp_matrix_modelview_push_mul(Mtx *m) {
    gSPMatrix(gfx_list_ptr++, OS_K0_TO_PHYSICAL(m),
              G_MTX_MODELVIEW | G_MTX_PUSH | G_MTX_MUL);
}

static inline void dl_sp_pop_matrix_modelview(void) {
    gSPPopMatrix(gfx_list_ptr++, G_MTX_MODELVIEW);
}

static inline void dl_sp_persp_normalize(u16 persp_norm) {
    gSPPerspNormalize(gfx_list_ptr++, persp_norm);
}

// Render-state wrappers for drawing the cube. The render-mode and geometry-mode
// flag expressions are macros, so they stay on the C side.
static inline void dl_dp_set_cycle_type_1cycle(void) {
    gDPSetCycleType(gfx_list_ptr++, G_CYC_1CYCLE);
}

static inline void dl_dp_set_render_mode_aa_zb_opa(void) {
    gDPSetRenderMode(gfx_list_ptr++, G_RM_AA_ZB_OPA_SURF, G_RM_AA_ZB_OPA_SURF2);
}

static inline void dl_sp_clear_geometry_mode_all(void) {
    gSPClearGeometryMode(gfx_list_ptr++, 0xFFFFFFFF);
}

static inline void dl_sp_set_geometry_mode_box(void) {
    gSPSetGeometryMode(gfx_list_ptr++, G_SHADE | G_SHADING_SMOOTH | G_ZBUFFER);
}

static inline void dl_sp_2triangles(int v00, int v01, int v02, int flag0,
                                    int v10, int v11, int v12, int flag1) {
    gSP2Triangles(gfx_list_ptr++, v00, v01, v02, flag0, v10, v11, v12, flag1);
}
