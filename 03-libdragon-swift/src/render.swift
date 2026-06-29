// Swift drawing logic, called once per frame from main.c.
//
// swift_render is declared in render_bridge.h, so @c @implementation lets the
// compiler validate the signature against that C declaration.
//
// Everything here is integer math: an animated grid of color cells whose hue
// scrolls with the frame counter. No floats cross the Swift<->C boundary.

private let CELLS_X: Int32 = 16
private let CELLS_Y: Int32 = 12

// Map a 0..255 "hue-ish" ramp to an RGB triple using cheap integer ramps,
// producing a smoothly cycling color without floating point.
private func colorRamp(_ t: Int32) -> (UInt8, UInt8, UInt8) {
    let p = t & 0xFF
    let r = Int32(abs(Int(p) - 128)) * 2          // bright at edges
    let g = 255 - Int32(abs(Int(p) - 85) * 3)     // peak near 85
    let b = 255 - Int32(abs(Int(p) - 170) * 3)    // peak near 170
    func clamp(_ v: Int32) -> UInt8 {
        if v < 0 { return 0 }
        if v > 255 { return 255 }
        return UInt8(v)
    }
    return (clamp(r), clamp(g), clamp(b))
}

// Pack a color and two rectangle corners into the 3 register arguments
// bridge_fill_rect expects (see render_bridge.h).
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
            // last row/column extends to the screen edge to avoid gaps
            let x1 = (cx == CELLS_X - 1) ? (w - 1) : (x0 + cellW - 1)
            let y1 = (cy == CELLS_Y - 1) ? (h - 1) : (y0 + cellH - 1)
            bridge_fill_rect(packRGBA(r, g, b), packXY(x0, y0), packXY(x1, y1))
            cx += 1
        }
        cy += 1
    }
}
