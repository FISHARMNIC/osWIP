void gfx_fillRect(int x, int y, int width, int height, gfx_ctx_t* ctx)
{
    int color = ctx->color_fg;
    uint16_t *addr = &VGARAM[x + y * SCREEN_WIDTH];
    int i, j;
 
    for (i = 0; i < height; i++) {
        for (j = 0; j < width; j++) {
            addr[j] = color; 
        }
        addr += SCREEN_WIDTH;
    }
}

void gfx_getRect(int x, int y, int width, int height, uint16_t* saveBuffer)
{
    uint16_t *addr = &VGARAM[x + y * SCREEN_WIDTH];
    int i, j;
 
    for (i = 0; i < height; i++) {
        for (j = 0; j < width; j++) {
            saveBuffer[j] = addr[j]; 
        }
        saveBuffer += width;
        addr += SCREEN_WIDTH;
    }
}

void gfx_drawBuffer(int x, int y, int width, int height, uint16_t* saveBuffer)
{
    uint16_t *addr = &VGARAM[x + y * SCREEN_WIDTH];
    int i, j;
 
    for (i = 0; i < height; i++) {
        for (j = 0; j < width; j++) {
            addr[j] = saveBuffer[j]; 
        }
        saveBuffer += width;
        addr += SCREEN_WIDTH;
    }
}

static inline void gfx_drawMouse(int x, int y)
{
    gfx_drawInvertedTranparentChar(24, x, y);
}