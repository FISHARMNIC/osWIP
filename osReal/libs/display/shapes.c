void gfx_fillRect_col(int x, int y, int width, int height, int color)
{
    uint16_t *addr = &VGARAM[x + y * SCREEN_WIDTH];
    int i, j;
    //height -= y + SCREEN_HEIGHT - height ;
 
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

void gfx_fillBorderedRect_col(int x, int y, int width, int height, int color, int borderColor, int borderWidth)
{
    uint16_t *addr = &VGARAM[x + y * SCREEN_WIDTH];
    int i, j;
 
    for (j = 0; j < width - 1; j++) {
        addr[j] = borderColor; 
    }
    addr += SCREEN_WIDTH;

    for (i = 1; i < height; i++) {
        *addr = borderColor;  
        for (j = 1; j < width - 1; j++) {
            addr[j] = color; 
        }
        addr[j] = borderColor;
        addr += SCREEN_WIDTH;
    }

    for (j = 0; j < width - 1; j++) {
        addr[j] = borderColor; 
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


uint8_t* gfx_mouse_current_glpyh = MOUSE_FONT_REG;
static inline void gfx_drawMouse(int x, int y)
{
    gfx_drawInvertedTranparentGlyph(gfx_mouse_current_glpyh, x, y); // old: 24
}