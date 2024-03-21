#pragma once

typedef struct
{
    uint32_t x;
    uint32_t y; 
    uint32_t width;
    uint32_t height;
    gfx_ctx_t window_ctx;
} window_t;

#include "window.c"
#include "desktop.c"