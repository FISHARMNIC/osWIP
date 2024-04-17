typedef struct
{
    WIDGET_REQUIRED_ITEMS;
    char *buffer;
    uint32_t max_width;
} widget_input_t;

widget_input_t *widget_input_create(char *buffer, uint32_t max_width, gfx_ctx_t *ctx)
{
    widget_input_t *widget = (widget_input_t *)malloc(sizeof(widget_input_t));
    *widget = (widget_input_t){
        .buffer = buffer,
        .max_width = max_width,
        .ctx = ctx};
    return widget;
}

void widget_input_render(window_t *window, widget_input_t *widget, uint32_t x, uint32_t y)
{
    gfx_fillRect_col(window->x + x, window->y + y + WINDOW_BAR_HEIGHT + 3, widget->max_width, 18, widget->ctx->color_bg);
    gfx_drawString(widget->buffer, window->x + x, window->y + y + WINDOW_BAR_HEIGHT);
}

void widget_input_handler(window_t *window, widget_input_t *widget, uint32_t x, uint32_t y, int32_t rel_mouse_x, int32_t rel_mouse_y)
{

    if (
        rel_mouse_x >= x &&
        rel_mouse_y >= (y) &&
        rel_mouse_x <= (x + widget->max_width) &&
        rel_mouse_y <= (y + WINDOW_BAR_HEIGHT + 3 + 18))
    {
        mouse_write(0xF5);
        getKeyCode(); // take extra byte
        gets(widget->buffer);
        mouse_cycle = 1;
        mouse_write(0xF4);
    }
    // if (rel_mouse_x >= x)
    // {
    //     widget->buffer = "100";
    //     if(rel_mouse_y >= y)
    //     {    
    //         itoa(rel_mouse_y, widget->buffer);
    //         if(rel_mouse_y <= (y + WINDOW_BAR_HEIGHT + 6 + 18))
    //         {
    //             widget->buffer = "3";
    //         }
    //     }
    // }
    // else {
    //     widget->buffer = "0";
    // }
}