typedef struct
{
    WIDGET_REQUIRED_ITEMS;
    char* text;
} widget_text_t;


widget_text_t* widget_text_create(char* text, gfx_ctx_t* ctx)
{
    widget_text_t* widget = (widget_text_t*) malloc(sizeof(widget_text_t));
    *widget = (widget_text_t){
        .text =text,
        .ctx = ctx
    };
    return widget;
}

void widget_text_render(window_t* window, widget_text_t* widget, uint32_t x, uint32_t y)
{
    gfx_drawString(widget->text, window->x + x, window->y + y + WINDOW_BAR_HEIGHT);
}