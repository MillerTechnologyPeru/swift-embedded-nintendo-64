// Static data for gfx.swift: globals and C-macro-initialized display lists
// that cannot be expressed in Swift.

#include <nusys.h>
#include "gfx_bridge.h"

GfxTask gfx_tasks[MAX_GFX_TASKS];
Gfx *gfx_list_ptr;
int current_task = -1;

// Conversion from (-1,-1,-1)-(1,1,1), with a 2-bit decimal suffix
static Vp gfx_vp = {
    SCREEN_WD * 2, SCREEN_HT * 2, G_MAXZ / 2, 0,  // Scale
    SCREEN_WD * 2, SCREEN_HT * 2, G_MAXZ / 2, 0,  // Translate
};

Gfx gfx_setup_rdpstate[] = {
    gsDPSetRenderMode(G_RM_OPA_SURF, G_RM_OPA_SURF2),
    gsDPSetCombineMode(G_CC_SHADE, G_CC_SHADE),
    gsDPSetScissor(G_SC_NON_INTERLACE, 0, 0, SCREEN_WD, SCREEN_HT),
    gsDPSetColorDither(G_CD_BAYER),
    gsSPEndDisplayList()
};

Gfx gfx_setup_rspstate[] = {
    gsSPViewport(&gfx_vp),
    gsSPClearGeometryMode(0xFFFFFFFF),
    gsSPSetGeometryMode(G_ZBUFFER | G_SHADE | G_SHADING_SMOOTH | G_CULL_BACK),
    gsSPTexture(0, 0, 0, 0, G_OFF),
    gsSPEndDisplayList()
};
