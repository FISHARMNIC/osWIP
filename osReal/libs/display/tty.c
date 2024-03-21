void tty_init_ctx(int x, int y, int cols, gfx_ctx_t *gfx_ctx, tty_ctx_t *tty_ctx)
{
    *tty_ctx = (tty_ctx_t){
        .bounds_x = x,
        .bounds_y = y,
        .current_x = x,
        .current_y = y + 16,
        .cols = cols * gfx_ctx->char_spacing,
        .text_ctx = *gfx_ctx};
}

void tty_putChar_ctx(char character, tty_ctx_t *ctx)
{
    char nl = character == '\n';
    if (!nl)
    {
        gfx_drawChar_ctx(character, ctx->current_x, ctx->current_y, &ctx->text_ctx);
        ctx->current_x += ctx->text_ctx.char_spacing;
    }
    if (nl || ((ctx->current_x - ctx->bounds_x) > ctx->cols))
    {
        ctx->current_y+= ctx->text_ctx.line_spacing;
        ctx->current_x = ctx->bounds_x;
    }
}

static inline void tty_putChar(char character)
{
    tty_putChar_ctx(character, &tty_current_ctx);
}

void tty_putString_ctx(char *string, tty_ctx_t *ctx)
{
    while (*string != 0)
    {
        tty_putChar_ctx(*(string++), ctx);
    }
}

static inline void tty_putString(char *string)
{
    tty_putString_ctx(string, &tty_current_ctx);
}

void tty_putInt_ctx(uint32_t number, tty_ctx_t *ctx)
{
    int len = numLen(number) - 1;
    if (number == 0) {
        tty_putChar('0');
    }
    else
    {
        while (number >= 1)
        {
            tty_putChar((char)(number % 10) + 48);
            number /= 10;
        }
    }
}

static inline void tty_putInt(uint32_t number)
{
    tty_putInt_ctx(number, &tty_current_ctx);
}

static inline void tty_putInt_nl(uint32_t number)
{
    tty_putInt_ctx(number, &tty_current_ctx);
    tty_putChar_ctx('\n', &tty_current_ctx);
}