// Swift drawing logic, called once per frame from main.c.
//
// clamp() and cell-edge selection live in render_bridge.c (compiled by the
// libdragon mips64-elf GCC) because LLVM emits movn/movz (MIPS IV conditional
// moves) for Swift conditionals, and the VR4300 is MIPS III — those opcodes
// raise a Reserved Instruction exception at runtime.

private let CELLS_X: Int32 = 16
private let CELLS_Y: Int32 = 12

private func colorRamp(_ t: Int32) -> (UInt8, UInt8, UInt8) {
    let p = t & 0xFF
    let r = bridge_abs(p - 128) * 2
    let g = 255 - bridge_abs(p - 85) * 3
    let b = 255 - bridge_abs(p - 170) * 3
    return (bridge_clamp(r), bridge_clamp(g), bridge_clamp(b))
}

private func packRGBA(_ r: UInt8, _ g: UInt8, _ b: UInt8) -> UInt32 {
    (UInt32(r) << 24) | (UInt32(g) << 16) | (UInt32(b) << 8) | 0xFF
}

private func packXY(_ x: Int32, _ y: Int32) -> UInt32 {
    (UInt32(truncatingIfNeeded: x) << 16) | (UInt32(truncatingIfNeeded: y) & 0xFFFF)
}

@c @implementation
func swift_render(_ frame: UInt32) {
    bridge_begin_fill()

    let w = bridge_screen_width()
    let h = bridge_screen_height()
    let cellW = w / CELLS_X
    let cellH = h / CELLS_Y
    let f = Int32(truncatingIfNeeded: frame)

    var cy: Int32 = 0
    while cy < CELLS_Y {
        var cx: Int32 = 0
        while cx < CELLS_X {
            let (r, g, b) = colorRamp((cx + cy) * 16 + f * 4)
            let x0 = cx * cellW
            let y0 = cy * cellH
            let x1 = bridge_cell_edge(x0, cellW, w)
            let y1 = bridge_cell_edge(y0, cellH, h)
            bridge_fill_rect(packRGBA(r, g, b), packXY(x0, y0), packXY(x1, y1))
            cx += 1
        }
        cy += 1
    }
}
