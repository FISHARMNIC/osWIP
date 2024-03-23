#pragma once

#define WINDOW_BAR_HEIGHT 20

typedef struct
{
    uint32_t x;
    uint32_t y; 
    uint32_t width;
    uint32_t height;
    char* title;
    void* event;
    linked_t widgets;
    gfx_ctx_t window_ctx;
} window_t;

enum {
    EVENT_EXPOSE,
    EVENT_CLICK,
};

typedef struct
{
    uint32_t mouse_x;
    uint32_t mouse_y;
    window_t* window;
    uint32_t type;
} window_event_t;

typedef void window_event_fn(window_event_t*);

#include "widgets/include.h"
#include "windows/window.c"
#include "desktop.c"