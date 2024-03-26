static linked_t allWindows; // todo: malloc

// awful, make this a struct
static window_t *wasClicked_ptr = 0;
static uint32_t wasClicked_x = 0;
static uint32_t wasClicked_y = 0;
static uint32_t wasClicked_outOfBar = 0;
static uint32_t wasClicked_resize = 0;
static window_t wasClicked_win;

static volatile uint8_t windowIsSelected = 0;

void window_draw(window_t *window)
{
    gfx_fillBorderedRect_col(window->x, window->y, window->width, WINDOW_BAR_HEIGHT, wasClicked_ptr == window ? COLOR_WHITE : COLOR_ENV_GREEN(5), 0, 1); // bar
    gfx_drawTransparentString_ctx("- + X", window->x + window->width - 60, window->y, (gfx_ctx_t *)&GFX_DEFAULT_BLACK);                                  // tools
    gfx_drawTransparentString_ctx(window->title, window->x + 5, window->y, (gfx_ctx_t *)&GFX_DEFAULT_BLACK);                                             // title
    gfx_fillBorderedRect_col(window->x, window->y + WINDOW_BAR_HEIGHT, window->width, window->height, window->window_ctx.color_fg, 0, 1);                // window
    gfx_fillBorderedRect_col(window->x + window->width - WINDOW_RESIZE_AREA, window->y + WINDOW_BAR_HEIGHT + window->height - WINDOW_RESIZE_AREA, WINDOW_RESIZE_AREA, WINDOW_RESIZE_AREA, COLOR_GRAY(10), 0, 1);         // re-size

    widget_drawAll(window);
}

void window_render(window_t *window)
{
    window_draw(window);
    if (window->event != 0)
    {
        window_event_t event = {
            .mouse_x = mouse_x - window->x,
            .mouse_y = mouse_y - window->y,
            .window = window,
            .type = EVENT_EXPOSE};
        ((window_event_fn *)(window->event))(&event);
    }
}

void window_renderAll()
{
    linked_t current = allWindows;
    while (current != 0)
    {
        window_render((window_t *)current->item);
        current = (linked_t)current->next;
    }
    gfx_db_swap();
}

window_t *window_create(uint32_t x, uint32_t y, uint32_t width, uint32_t height, char *title, window_event_fn *event)
{
    window_t *window = (window_t *)malloc(sizeof(window_t));
    *window = (window_t){
        .x = x,
        .y = y,
        .width = width,
        .height = height,
        .title = title,
        .event = (void *)event,
        .window_ctx = gfx_init_ctx_rgb_rtrn(COLOR_ENV_GREEN(10)),
    };
    linked_add(&allWindows, (void *)window);
    return window;
}

void window_checkMove(int32_t mouse_x, int32_t mouse_y)
{
    gfx_mouse_current_glpyh = MOUSE_FONT_REG;
    if (windowIsSelected)
    {
        if (mouse_x != wasClicked_x || mouse_y != wasClicked_y)
        {
            gfx_clearRect(wasClicked_ptr->x, wasClicked_ptr->y, wasClicked_ptr->width, wasClicked_ptr->height + WINDOW_BAR_HEIGHT);
            if(!wasClicked_outOfBar)
            {
                wasClicked_ptr->x = wasClicked_win.x + (mouse_x - wasClicked_x);
                wasClicked_ptr->y = wasClicked_win.y + (mouse_y - wasClicked_y);
            }
            else if (wasClicked_resize)
            {
                gfx_mouse_current_glpyh = MOUSE_FONT_SIZE;
                wasClicked_ptr->width = wasClicked_win.width + (mouse_x - wasClicked_x);
                wasClicked_ptr->height = wasClicked_win.height + (mouse_y - wasClicked_y);
            }
        }
        window_renderAll();
    }
}

void window_checkClick(int32_t click_x, int32_t click_y, int8_t type)
{
    if (type == 1)
    {
        linked_raw_t *current = allWindows;
        int final = -1;
        int index = 0;
        window_t *window;
        while (current != 0)
        {
            window = (window_t *)current->item;
            if (
                click_x >= window->x &&
                click_y >= window->y &&
                click_x <= (window->x + window->width) &&
                click_y <= (window->y + window->height + WINDOW_BAR_HEIGHT))
            {
                final = index;
                if (click_y <= window->y + WINDOW_BAR_HEIGHT) // in taskbar
                {
                    if (click_x > window->x + window->width - 60)
                    {
                        windowIsSelected = 0;
                        gfx_clearRect(window->x, window->y, window->width, window->height + WINDOW_BAR_HEIGHT);
                        linked_remove(&allWindows, final);
                        window_renderAll();
                        return;
                    }
                }
            }
            current = (linked_raw_t *)current->next;
            index++;
        }
        if (final != -1) // if click on a window
        {
            if (final != index - 1)
            { // if its not the last window
                linked_moveToEnd(&allWindows, final);
            }
            window = (window_t *)(linked_read_link(allWindows, -1)->item);

            wasClicked_outOfBar = click_y > (window->y + WINDOW_BAR_HEIGHT);
            wasClicked_resize = click_x > (window->x + window->width - WINDOW_RESIZE_AREA) && click_y > (window->y + window->height + WINDOW_BAR_HEIGHT - WINDOW_RESIZE_AREA);
            wasClicked_x = click_x;
            wasClicked_y = click_y;
            wasClicked_ptr = window;
            wasClicked_win = *window;
            windowIsSelected = 1;
            
            if (final == index - 1 && wasClicked_outOfBar)
            {
                if (window->event != 0)
                {
                    window_event_t event = {
                        .mouse_x = click_x - window->x,
                        .mouse_y = click_y - window->y,
                        .window = window,
                        .type = EVENT_CLICK};
                    ((window_event_fn *)(window->event))(&event); // trigger ONCLICK event
                }
            }

            window_renderAll();
        }
        else
        {
            windowIsSelected = 0;
        }
    }
    else
    {
        windowIsSelected = 0;
    }
}