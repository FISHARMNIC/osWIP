static linked_t allWindows; // todo: malloc

static window_selected_t wasClicked;

static volatile uint8_t windowIsSelected = 0;

void window_draw(window_t *window)
{
    uint32_t x = window->x;
    uint32_t y = window->y;
    uint32_t width = window->width;
    uint32_t height = window->height;

    gfx_fillBorderedRect_col(x, y, width, WINDOW_BAR_HEIGHT, wasClicked.ptr == window ? COLOR_WHITE : COLOR_ENV_GREEN(5), 0, 1); // bar
    gfx_drawTransparentString_ctx("- + X", x + width - 60, y, (gfx_ctx_t *)&GFX_DEFAULT_BLACK);                                  // tools
    gfx_drawTransparentString_ctx(window->title, x + 5, y, (gfx_ctx_t *)&GFX_DEFAULT_BLACK);                                     // title
    gfx_fillBorderedRect_col(x, y + WINDOW_BAR_HEIGHT - 1, width, height, window->window_ctx.color_fg, 0, 1);                        // window
    gfx_fillBorderedRect_col(x + width - WINDOW_RESIZE_AREA, y + WINDOW_BAR_HEIGHT + height - WINDOW_RESIZE_AREA - 1, WINDOW_RESIZE_AREA, WINDOW_RESIZE_AREA, COLOR_GRAY(10), 0, 1);         // re-size square

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
    if(current == 0) 
    {
        taskbar_render();
        gfx_db_swap();
        return;
    }

    while (current->next != 0)
    {
        window_render((window_t *)current->item);
        current = (linked_t)current->next;
    }

    taskbar_render();
    window_render((window_t *)current->item);
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
        if (mouse_x != wasClicked.x || mouse_y != wasClicked.y)
        {
            gfx_fillRect_col(wasClicked.ptr->x, wasClicked.ptr->y, wasClicked.ptr->width, wasClicked.ptr->height + WINDOW_BAR_HEIGHT, desktop_background_color);
            if(!wasClicked.outOfBar)
            {
                wasClicked.ptr->x = wasClicked.win.x + (mouse_x - wasClicked.x);
                wasClicked.ptr->y = wasClicked.win.y + (mouse_y - wasClicked.y);
            }
            else if (wasClicked.resize)
            {
                gfx_mouse_current_glpyh = MOUSE_FONT_SIZE;
                wasClicked.ptr->width = wasClicked.win.width + (mouse_x - wasClicked.x);
                wasClicked.ptr->height = wasClicked.win.height + (mouse_y - wasClicked.y);
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
                        gfx_fillRect_col(window->x, window->y, window->width, window->height + WINDOW_BAR_HEIGHT, desktop_background_color);
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

            wasClicked = (window_selected_t){
                .outOfBar = click_y > (window->y + WINDOW_BAR_HEIGHT),
                .resize = click_x > (window->x + window->width - WINDOW_RESIZE_AREA) && click_y > (window->y + window->height + WINDOW_BAR_HEIGHT - WINDOW_RESIZE_AREA),
                .x = click_x,
                .y = click_y,
                .ptr = window,
                .win = *window,
            };

            windowIsSelected = 1;

            if (final == index - 1 && wasClicked.outOfBar)
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