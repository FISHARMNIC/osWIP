#pragma once 
#include <stdint.h>

#define SCREEN_WIDTH 640
#define SCREEN_HEIGHT 480
#define SCREEN_SIZE SCREEN_WIDTH * SCREEN_HEIGHT

#define VGA_ADDRESS 0xfd000000 //run "lspci -i" on grub console to get addr (0xe0000000 for vbox)

#define CHAR_WIDTH 8
#define CHAR_DISP_WIDTH CHAR_WIDTH + 2
#define CHAR_HEIGHT 16

// green gets 6 bits, red and blue only get 5
#define COL_RED_MAX 31
#define COL_BLUE_MAX COL_RED_MAX
#define COL_GREEN_MAX 63
#define FORMAT_COLOR(r,g,b) (((r) << (6 + 5)) | ((g) << 5) | (b))

#define COLOR_GRAY(amount) FORMAT_COLOR(COL_RED_MAX - amount, COL_GREEN_MAX - amount, COL_BLUE_MAX - amount)
#define COLOR_WHITE COLOR_GRAY(0)

typedef struct {
    int color_fg;
    int color_bg;
    int char_spacing;
    int line_spacing;
} gfx_ctx_t;
gfx_ctx_t gfx_current_ctx;

gfx_ctx_t GFX_DEFAULT_WHITE = {
    .color_fg = COLOR_WHITE,
    .color_bg = 0,
    .char_spacing = CHAR_DISP_WIDTH,
    .line_spacing = CHAR_HEIGHT
};

gfx_ctx_t GFX_DEFAULT_BLACK = {
    .color_fg = 0,
    .color_bg = COLOR_WHITE,
    .char_spacing = CHAR_DISP_WIDTH,
    .line_spacing = CHAR_HEIGHT
};

typedef struct {
    int bounds_x;
    int bounds_y;
    int current_x;
    int current_y;
    int cols;
    gfx_ctx_t text_ctx;
} tty_ctx_t;

tty_ctx_t tty_current_ctx;

uint16_t VGA_BACKBUFFER[SCREEN_WIDTH * SCREEN_HEIGHT];
uint16_t *VGARAM = (uint16_t *)VGA_ADDRESS;

#include "../ports/include.h"
#include "../sys/include.h"
#include "font.h"
#include "pixel.c"
#include "text.c"
#include "tty.c"
#include "shapes.c"
#include "swap.c"