// Swift implementation of stage1.c.
// stage1_init and stage1_loop are declared in stage1.h (imported via
// gfx_bridge.h), so they use @c @implementation for signature validation.
//
// Vertex data stays in C (stage1_data.c) for RCP DMA alignment.
// Matrix setup (guPerspective, guLookAt, guPosition) stays in C
// (stage1_matrix.c) to guarantee float-argument ABI compatibility with the
// N64 GCC-compiled gu* library. Display-list macros go through the dl_*
// wrappers in gfx_bridge.h.

private var boxRotationRoll: Float = 0
private var boxRotationPitch: Float = 0

private func stage1_draw_box() {
    // load vertex data for the triangles
    dl_sp_vertex_square()
    // 1 or 2 cycle rendering — pick 1 cycle
    dl_dp_set_cycle_type_1cycle()
    // antialiased opaque surface
    dl_dp_set_render_mode_aa_zb_opa()
    // reset flags from the previous primitive
    dl_sp_clear_geometry_mode_all()
    // smooth (gourad) shading and z-buffering
    dl_sp_set_geometry_mode_box()

    // draw the cube faces
    dl_sp_2triangles(0, 1, 2, 0, 0, 2, 3, 0)  // front
    dl_sp_2triangles(5, 4, 7, 5, 5, 7, 6, 5)  // back
    dl_sp_2triangles(6, 5, 1, 6, 6, 1, 2, 6)  // right
    dl_sp_2triangles(0, 7, 3, 0, 0, 4, 7, 0)  // left

    // prevent rendering-hardware race conditions before settings change
    dl_dp_pipe_sync()
}

private func stage1_draw() {
    let gfxTask = gfx_new_task()!

    // prepare the RCP for rendering a graphics task
    gfx_rcp_init()

    // clear the color framebuffer and Z-buffer, similar to glClear()
    gfx_clear_cfb()

    // initialize the projection matrix (called from C for float ABI safety)
    let perspNorm = stage1_setup_projection(gfxTask)
    dl_sp_persp_normalize(perspNorm)

    // initialize the modelview matrix (called from C for float ABI safety)
    stage1_setup_modelview(gfxTask)

    // load the projection and modelview matrices into the matrix stack
    dl_sp_matrix_projection_load(gfx_task_projection(gfxTask))
    dl_sp_matrix_modelview_load(gfx_task_modelview(gfxTask))

    // create and push the object transformation matrix. Pass the rotation
    // floats as bit patterns to avoid a float-argument ABI mismatch (see
    // stage1_matrix.c).
    stage1_setup_object_transform(gfxTask, u32(boxRotationRoll.bitPattern), u32(boxRotationPitch.bitPattern))
    dl_sp_matrix_modelview_push_mul(gfx_task_object_transform(gfxTask, 0))

    stage1_draw_box()

    // pop the matrix we pushed, restoring the previous drawing position
    dl_sp_pop_matrix_modelview()

    // mark the end of the display list
    dl_dp_full_sync()
    dl_sp_end_display_list()

    // create a graphics task to render this displaylist and send it to the RCP
    gfx_task_submit(gfxTask)
}

private func stage1_update() {
    boxRotationRoll += 1.0
    if boxRotationRoll > 360.0 {
        boxRotationRoll = 0.0
    }

    boxRotationPitch += 0.5
    if boxRotationPitch > 360.0 {
        boxRotationPitch = 0.0
    }
}

@c @implementation
func stage1_init() {}

@c @implementation
func stage1_loop(_ pendingGfx: CInt) {
    if pendingGfx < 1 {
        stage1_draw()
    }
    stage1_update()
}
