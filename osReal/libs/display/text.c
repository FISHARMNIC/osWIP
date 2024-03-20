// ================================= drawChar =================================
// from osdev
/// @brief Put character using a context
/// @param character character for printing
void gfx_drawChar_ctx(unsigned char character, int x, int y, gfx_ctx_t* ctx)
{
    int cx, cy;
    int mask[8] = {1, 2, 4, 8, 16, 32, 64, 128};
    
    uint8_t *glyph = (uint8_t*)((int)VGA_FONT + (int)character * 16);

    for (cy = 0; cy < 16; cy++)
    {
        for (cx = 1; cx < 8; cx++)
        {
            gfx_drawPixel_color((glyph[cy] & mask[8 - cx]) ? ctx->color_fg : ctx->color_bg, x + cx, y + cy - 12);
        }
    }
}

/// @brief Put character using current context
static inline void gfx_drawChar(unsigned char character, int x, int y)
{
    gfx_drawChar_ctx(character, x, y, &gfx_current_ctx);
}

// ================================= drawTransparentChar =================================
/// @brief Put transparent character using a context 
void gfx_drawTransparentChar_ctx(unsigned char character, int x, int y, gfx_ctx_t* ctx)
{
    int cx, cy;
    int mask[8] = {1, 2, 4, 8, 16, 32, 64, 128};
    
    uint8_t *glyph = VGA_FONT + (int)character * 16;

    for (cy = 0; cy < 16; cy++)
    {
        for (cx = 1; cx < 8; cx++)
        {
            if(glyph[cy] & mask[8 - cx]) 
                gfx_drawPixel(x + cx, y + cy - 12);
        }
    }
}

void gfx_drawInvertedTranparentChar(unsigned char character, int x, int y)
{
    int cx, cy;
    int mask[8] = {1, 2, 4, 8, 16, 32, 64, 128};
    
    uint8_t *glyph = VGA_FONT + (int)character * 16;

    for (cy = 0; cy < 16; cy++)
    {
        for (cx = 1; cx < 8; cx++)
        {
            if(glyph[cy] & mask[8 - cx]) 
                gfx_drawInvertedPixel(x + cx, y + cy - 12);
        }
    }
}
/// @brief Put transparent character using current context
static inline void gfx_drawTransparentChar(unsigned char character, int x, int y)
{
    gfx_drawTransparentChar_ctx(character, x, y, &gfx_current_ctx);
}

void gfx_drawString(char * string, int x, int y)
{
    char current;
    int index = 0;
    do {
        current = string[index];
        gfx_drawChar(current, x + (index * gfx_current_ctx.char_spacing), y);
        index++;
    }  while(current != 0);
}

void gfx_drawInt(int32_t number, int x, int y)
{
    int char_spacing = gfx_current_ctx.char_spacing;

    if(number < 0)
    {
        number = -number;
        gfx_drawChar('-', x, y);
        x += char_spacing;
    }

    int len = numLen((uint32_t)number) - 1;
    x += len * char_spacing;
    if (number == 0) {
        gfx_drawChar('0', x, y);
    }
    else
    {
        while (number >= 1)
        {
            gfx_drawChar((char)(number % 10) + 48, x, y);
            number /= 10;
            x -= char_spacing;
        }
    }
}