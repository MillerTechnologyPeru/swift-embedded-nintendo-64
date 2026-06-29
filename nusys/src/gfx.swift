// Swift implementation of gfx.h — uses @c @implementation (Swift 6.3) so
// the compiler validates each function against the C declaration in gfx.h.
//
// Static display-list data and C-macro-dependent globals live in gfx_statics.c
// because N64 GBI initialiser macros (gs*) cannot be expressed in Swift.
// Thin static-inline wrappers in gfx_bridge.h let Swift call the runtime
// display-list macros (g*) without needing C macro expansion.

@c @implementation
func gfx_rcp_init() {
    dl_sp_segment(0, 0)
    dl_sp_display_list(gfx_rspstate_phys())
    dl_sp_display_list(gfx_rdpstate_phys())
}

@c @implementation
func gfx_clear_cfb() {
    // Clear the Z-buffer
    dl_dp_set_depth_image(gfx_zbuffer_phys())
    dl_dp_set_cycle_type(Int32(G_CYC_FILL))
    dl_dp_set_color_image(Int32(G_IM_FMT_RGBA), Int32(G_IM_SIZ_16b), Int32(SCREEN_WD), gfx_zbuffer_phys())
    dl_dp_set_fill_color(gfx_zbuffer_fill_color())
    dl_dp_fill_rectangle(0, 0, Int32(SCREEN_WD) - 1, Int32(SCREEN_HT) - 1)
    dl_dp_pipe_sync()

    // Clear the frame buffer
    dl_dp_set_color_image(Int32(G_IM_FMT_RGBA), Int32(G_IM_SIZ_16b), Int32(SCREEN_WD), gfx_cfb_phys())
    dl_dp_set_fill_color(gfx_cfb_fill_color())
    dl_dp_fill_rectangle(0, 0, Int32(SCREEN_WD) - 1, Int32(SCREEN_HT) - 1)
    dl_dp_pipe_sync()
}

@c @implementation
func gfx_new_task() -> UnsafeMutablePointer<GfxTask>! {
    current_task = (current_task + 1) % Int32(MAX_GFX_TASKS)
    let nextTask = gfx_get_task(current_task)!
    gfx_list_ptr = gfx_task_display_list(nextTask)
    return nextTask
}
