// todo, re work this library. A lot of reused stuff that could be abstracted
// can mask be rewritten using shifting instead?

static int cx, cy;
uint8_t *glyph;

#define mask(offset) (1 << (offset))

/// @brief Put character using a context
/// @param character character for printing
void gfx_drawGlyph_ctx(unsigned char character, int x, int y, uint8_t* glyph, gfx_ctx_t* ctx)
{
    y += CHAR_HEIGHT;
    for (cy = 0; cy < 16; cy++)
    {
        for (cx = 1; cx < 9; cx++)
        {
            gfx_drawPixel_color((glyph[cy] & mask(8 - cx)) ? ctx->color_fg : ctx->color_bg, x + cx, y + cy - 12);
        }
    }
}

static inline void gfx_drawChar_ctx(unsigned char character, int x, int y, gfx_ctx_t* ctx)
{
    gfx_drawGlyph_ctx(character, x, y, (uint8_t*)((int)VGA_FONT + (int)character * 16), ctx);
}

/// @brief Put character using current context
static inline void gfx_drawChar(unsigned char character, int x, int y)
{
    gfx_drawChar_ctx(character, x, y, &gfx_current_ctx);
}

/// @brief Put transparent character using a context 
void gfx_drawTransparentChar_ctx(unsigned char character, int x, int y, gfx_ctx_t* ctx)
{
    glyph = VGA_FONT + (int)character * 16;

    for (cy = 0; cy < 16; cy++)
    {
        for (cx = 1; cx < 8; cx++)
        {
            if(glyph[cy] & mask(8 - cx)) 
                gfx_drawPixel(x + cx, y + cy - 12);
        }
    }
}

void gfx_drawInvertedTranparentGlyph(uint8_t* glyph, int x, int y)
{
    for (cy = 0; cy < 16; cy++)
    {
        for (cx = 1; cx < 8; cx++)
        {
            if(glyph[cy] & mask(8 - cx)) 
                gfx_drawInvertedPixel(x + cx, y + cy - 12);
        }
    }
}

static inline void gfx_drawInvertedTranparentChar(unsigned char character, int x, int y)
{
    gfx_drawInvertedTranparentGlyph(VGA_FONT + (int)character * 16, x, y);
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
    }  while(string[index] != 0);
}

void gfx_drawString_ctx(char * string, int x, int y, gfx_ctx_t* ctx)
{
    char current;
    int index = 0;
    do {
        current = string[index];
        gfx_drawChar_ctx(current, x + (index * gfx_current_ctx.char_spacing), y, ctx);
        index++;
    }  while(string[index] != 0);
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