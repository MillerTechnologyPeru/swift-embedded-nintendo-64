// Matrix setup helpers for stage1.swift.
//
// guPerspective, guLookAt, and guPosition all take many float arguments.
// Calling them directly from Swift risks a float-argument ABI mismatch between
// LLVM MIPS (used by swiftc) and the N64 GCC-compiled gu* library functions.
// Wrapping them here keeps the call sites in N64 GCC-compiled code.

#include <nusys.h>
#include "gfx_bridge.h"

#define FOVY        45.0f
#define ASPECT      ((float)SCREEN_WD / (float)SCREEN_HT)
#define NEAR_PLANE  10.0f
#define FAR_PLANE   1000.0f

static const float camera_pos[3]    = { 0.0f, -200.0f, 200.0f };
static const float camera_target[3] = { 0.0f,   0.0f,   0.0f };
static const float camera_up[3]     = { 0.0f,   1.0f,   0.0f };

u16 stage1_setup_projection(GfxTask *task) {
    u16 persp_norm;
    guPerspective(&task->projection, &persp_norm,
                  FOVY, ASPECT, NEAR_PLANE, FAR_PLANE, 1.0f);
    return persp_norm;
}

void stage1_setup_modelview(GfxTask *task) {
    guLookAt(&task->modelview,
             camera_pos[0],    camera_pos[1],    camera_pos[2],
             camera_target[0], camera_target[1], camera_target[2],
             camera_up[0],     camera_up[1],     camera_up[2]);
}

// roll/pitch are passed as IEEE-754 bit patterns (u32) rather than float
// arguments: LLVM (swiftc) and N64 GCC disagree on whether trailing float
// arguments go in FP registers or GPRs under the o32 ABI, so passing them as
// integers and reinterpreting here keeps both compilers in agreement.
void stage1_setup_object_transform(GfxTask *task, u32 roll_bits, u32 pitch_bits) {
    union { u32 u; float f; } roll, pitch;
    roll.u = roll_bits;
    pitch.u = pitch_bits;
    guPosition(&task->object_transforms[0], roll.f, pitch.f, 0.0f, 1.0f, 0, 0, 0);
}
