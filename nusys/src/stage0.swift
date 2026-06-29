// Swift implementation of stage0.c.
// stage0_init and stage0_loop are declared in stage0.h (imported via
// gfx_bridge.h), so they use @c @implementation for signature validation.

private func stage0_draw() {
    let gfxTask = gfx_new_task()!
    gfx_rcp_init()
    gfx_clear_cfb()
    dl_dp_full_sync()
    dl_sp_end_display_list()
    gfx_task_submit(gfxTask)
}

private func stage0_update() {}

@c @implementation
func stage0_init() {}

@c @implementation
func stage0_loop(_ pendingGfx: CInt) {
    if pendingGfx < 1 {
        stage0_draw()
    }
    stage0_update()
}
