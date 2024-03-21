void gfx_fillRect_col(int x, int y, int width, int height, int color)
{
    uint16_t *addr = &VGARAM[x + y * SCREEN_WIDTH];
    int i, j;
 
    for (i = 0; i < height; i++) {
        for (j = 0; j < width; j++) {
            addr[j] = color; 
        }
        addr += SCREEN_WIDTH;
    }
}

static inline void gfx_fillRect(int x, int y, int width, int height, gfx_ctx_t* ctx)
{
    gfx_fillRect_col(x,y,width,height,ctx->color_fg);
}

static inline void gfx_clearRect(int x, int y, int width, int height)
{
    gfx_fillRect_col(x,y,width,height,0);
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