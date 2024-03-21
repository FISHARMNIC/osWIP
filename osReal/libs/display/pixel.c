#pragma once

/// @brief Put pixel at (x,y) using 16 bit r:g:b/5:6:5 color
/// @param col r:g:b 5:6:5 color
static inline void gfx_drawPixel_color(uint16_t col, int x, int y)
{
    VGARAM[x + y * SCREEN_WIDTH] = col;
}

/// @brief Put pixel at (x,y) using a context
static inline void gfx_drawPixel_ctx(int x, int y, gfx_ctx_t* ctx)
{
    VGARAM[x + y * SCREEN_WIDTH] = ctx->color_fg;
}

/// @brief Put pixel using current context
static inline void gfx_drawPixel(int x, int y)
{
    gfx_drawPixel_ctx(x,y,&gfx_current_ctx);
}

static inline void gfx_drawInvertedPixel(int x, int y)
{
    VGARAM[x + y * SCREEN_WIDTH] = ~VGARAM[x + y * SCREEN_WIDTH];
}

/// @brief Initiate a context
void gfx_init_ctx(gfx_ctx_t* ctx, uint32_t red, uint32_t green, uint32_t blue)
{
    *ctx = (gfx_ctx_t){
        .char_spacing = CHAR_WIDTH + 2,
        .line_spacing = CHAR_HEIGHT,
        .color_bg = 0,
        .color_fg = (red << (6 + 5)) | (green << 5) | blue
    };
}

gfx_ctx_t gfx_init_ctx_rtrn(uint32_t red, uint32_t green, uint32_t blue)
{
    return (gfx_ctx_t){
        .char_spacing = CHAR_WIDTH + 2,
        .line_spacing = CHAR_HEIGHT,
        .color_bg = 0,
        .color_fg = (red << (6 + 5)) | (green << 5) | blue
    };
}