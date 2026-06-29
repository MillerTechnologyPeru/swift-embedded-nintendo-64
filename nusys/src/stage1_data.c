// Vertex data for stage1.swift.
//
// This is read by the RCP via direct memory access, which requires 16-byte
// alignment, so it stays in C with __attribute__((aligned (16))). The Vtx
// type is a C union that doesn't import cleanly into Swift, which is the other
// reason to keep this data here.

#include <nusys.h>

// A static array of model vertex data: position (x,y,z), texture U,V coords
// (called S,T in the SDK) and vertex color values in r,g,b,a form.
Vtx square_verts[] __attribute__((aligned (16))) = {
  //  x,   y,  z, flag, S, T,    r,    g,    b,    a
  // front
  { -64,  64, 64,    0, 0, 0, 0x00, 0xff, 0x00, 0xff  },
  {  64,  64, 64,    0, 0, 0, 0x00, 0x00, 0x00, 0xff  },
  {  64, -64, 64,    0, 0, 0, 0x00, 0x00, 0xff, 0xff  },
  { -64, -64, 64,    0, 0, 0, 0xff, 0x00, 0x00, 0xff  },
  // back
  { -64,  64, -64,   0, 0, 0, 0x00, 0xff, 0x00, 0xff  },
  {  64,  64, -64,   0, 0, 0, 0x00, 0x00, 0x00, 0xff  },
  {  64, -64, -64,   0, 0, 0, 0x00, 0x00, 0xff, 0xff  },
  { -64, -64, -64,   0, 0, 0, 0xff, 0x00, 0x00, 0xff  },
};
