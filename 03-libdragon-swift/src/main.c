// libdragon entry point.
//
// C owns libdragon initialisation and the frame loop; each frame it attaches
// the display surface and hands rendering off to Swift (swift_render), then
// detaches and shows the frame. This mirrors example 02's "C drives, Swift
// implements" split, but on the open-source libdragon SDK and build system.

#include <libdragon.h>
#include "render_bridge.h"

int main(void) {
    // Route stdout to the emulator's IS-Viewer for debugging.
    debug_init_isviewer();

    display_init(RESOLUTION_320x240, DEPTH_16_BPP, 2, GAMMA_NONE, FILTERS_RESAMPLE);
    rdpq_init();

    uint32_t frame = 0;
    while (1) {
        surface_t *disp = display_get();
        rdpq_attach(disp, NULL);

        swift_render(frame);

        rdpq_detach_show();
        frame++;
    }
}
