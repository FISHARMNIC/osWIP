#pragma once

#define WINDOW_BAR_HEIGHT 20
#define WINDOW_RESIZE_AREA 10
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

typedef struct
{
    window_t *ptr;
    window_t win;
    uint32_t x;
    uint32_t y;
    uint32_t outOfBar;
    uint32_t resize;
} window_selected_t;

typedef void window_event_fn(window_event_t*);

uint16_t desktop_background_color = FORMAT_COLOR(25, 37, 17);

#include "taskbar/include.h"
#include "widgets/include.h"
#include "windows/window.c"

#include "desktop.c"