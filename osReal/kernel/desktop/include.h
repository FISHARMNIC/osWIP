#pragma once

#define WINDOW_BAR_HEIGHT 20
#define WINDOW_RESIZE_AREA 10
#define WINDOW_MIN_WIDTH   20
#define WINDOW_MIN_HEIGHT 20

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
    uint8_t flags;
} window_t;

enum {
    EVENT_EXPOSE,
    EVENT_CLICK,
    EVENT_MOVE,
    EVENT_KEYP
};

#define WINDOW_EVENT_MANDATORY_PROP uint32_t type; window_t* window

typedef struct // general struct for all events
{
    WINDOW_EVENT_MANDATORY_PROP;
} window_event_t;

typedef struct
{
    WINDOW_EVENT_MANDATORY_PROP;
} window_event_expose_t;

typedef struct
{
    WINDOW_EVENT_MANDATORY_PROP;
    uint32_t mouse_x;
    uint32_t mouse_y;
} window_event_move_t;

typedef window_event_move_t window_event_click_t;

typedef struct
{
    WINDOW_EVENT_MANDATORY_PROP;
    char key;
} window_event_keyp_t;

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

#define FLAGS_CLICK  0x1
#define FLAGS_MOVE   0x2
#define FLAGS_KEYP   0x4

#include "taskbar/include.h"
#include "widgets/include.h"
#include "windows/triggers.c"
#include "windows/window.c"

#include "desktop.c"