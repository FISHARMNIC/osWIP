static linked_t allWindows;
static window_selected_t wasClicked;
static volatile uint8_t windowIsSelected = 0;

void window_events_trigger_move(window_t *, int32_t, int32_t);
void window_events_trigger_expose(window_t *);
void window_events_trigger_keyp(window_t *, char);
void window_events_trigger_click(window_t *, int32_t, int32_t);

// next 4 funcs should not be included in the usermode window lib

void window_draw(window_t *window, int32_t rel_click_x, int32_t rel_click_y)
{
    uint32_t x = window->x;
    uint32_t y = window->y;
    uint32_t width = window->width;
    uint32_t height = window->height;

    gfx_fillBorderedRect_col(x, y, width, WINDOW_BAR_HEIGHT, wasClicked.ptr == window ? COLOR_WHITE : COLOR_ENV_GREEN(5), 0, 1);                                                     // bar
    gfx_drawTransparentString_ctx("- + X", x + width - 60, y, (gfx_ctx_t *)&GFX_DEFAULT_BLACK);                                                                                      // tools
    gfx_drawTransparentString_ctx(window->title, x + 5, y, (gfx_ctx_t *)&GFX_DEFAULT_BLACK);                                                                                         // title
    gfx_fillBorderedRect_col(x, y + WINDOW_BAR_HEIGHT - 1, width, height, window->window_ctx.color_fg, 0, 1);                                                                        // window
    gfx_fillBorderedRect_col(x + width - WINDOW_RESIZE_AREA, y + WINDOW_BAR_HEIGHT + height - WINDOW_RESIZE_AREA - 1, WINDOW_RESIZE_AREA, WINDOW_RESIZE_AREA, COLOR_GRAY(10), 0, 1); // re-size square

    widget_drawAll(window, rel_click_x, rel_click_y);
}

void window_render(window_t *window, int32_t rel_click_x, int32_t rel_click_y)
{
    window_draw(window, rel_click_x, rel_click_y);
    window_events_trigger_expose(window);
}

void window_render_and_swap(window_t *window, int32_t rel_click_x, int32_t rel_click_y)
{
    window_render(window, rel_click_x, rel_click_y);
    gfx_db_swap();
}

void window_renderAll(int32_t click_x, int32_t click_y)
{
    linked_t current = allWindows;
    if (current == 0)
    {
        taskbar_render();
        gfx_db_swap();
        return;
    }

    while (current->next != 0)
    {
        window_t *window = (window_t *)current->item;
        window_render(window, click_x - window->x, click_y - window->y);
        current = (linked_t)current->next;
    }

    taskbar_render();
    window_t *window = (window_t *)current->item;
    window_render(window, click_x - window->x, click_y - window->y);
    gfx_db_swap();
}

// This is the only function that should be a syscall.
window_t *window_create(uint32_t x, uint32_t y, uint32_t width, uint32_t height, char *title, window_event_fn *event, uint8_t flags)
{
    window_t *window = (window_t *)malloc(sizeof(window_t));
    *window = (window_t){
        .x = x,
        .y = y,
        .width = width,
        .height = height,
        .title = title,
        .event = (void *)event,
        .flags = flags,
        .window_ctx = gfx_init_ctx_rgb_rtrn(COLOR_ENV_GREEN(10)),
    };
    linked_add(&allWindows, (void *)window);
    return window;
}

// these should not be included in the usermode window lib

void window_checkMove(int32_t mouse_x, int32_t mouse_y)
{
    gfx_mouse_current_glpyh = MOUSE_FONT_REG;
    uint32_t rel_click_x = mouse_x - wasClicked.x;
    uint32_t rel_click_y = mouse_y - wasClicked.y;

    uint32_t win_x = wasClicked.ptr->x;
    uint32_t win_y = wasClicked.ptr->y;

    if (windowIsSelected) // if holding window
    {
        if (mouse_x != wasClicked.x || mouse_y != wasClicked.y) // mouse != last position
        {
            if (!wasClicked.outOfBar) // originally clicked on white bar
            {
                gfx_fillRect_col(win_x, win_y, wasClicked.ptr->width, wasClicked.ptr->height + WINDOW_BAR_HEIGHT, desktop_background_color);
                wasClicked.ptr->x = wasClicked.win.x + (rel_click_x);
                wasClicked.ptr->y = wasClicked.win.y + (rel_click_y);
            }
            else if (wasClicked.resize) // originally clicked on resize
            {
                gfx_mouse_current_glpyh = MOUSE_FONT_SIZE; // scale icon
                uint32_t newSizeX = wasClicked.win.width + (rel_click_x);
                uint32_t newSizeY = wasClicked.win.height + (rel_click_y);
                uint32_t oldSizeX = wasClicked.ptr->width;
                uint32_t oldSizeY = wasClicked.ptr->height;

                if (newSizeX < WINDOW_MIN_WIDTH)
                {
                    newSizeX = oldSizeX;
                }
                if (newSizeY < WINDOW_MIN_HEIGHT)
                {
                    newSizeY = oldSizeY;
                }

                wasClicked.ptr->width = newSizeX;
                wasClicked.ptr->height = newSizeY;
                if (newSizeX < oldSizeX || newSizeY < oldSizeY)
                {
                    gfx_fillRect_col(win_x, win_y, oldSizeX, oldSizeY + WINDOW_BAR_HEIGHT, desktop_background_color);
                    goto render;
                }
            }
            else
            { // originally clicked within the window
                if (wasClicked.ptr->flags & FLAGS_MOVE && (mouse_y > wasClicked.ptr->height + WINDOW_BAR_HEIGHT))
                {
                    goto trigger_event_move;
                }
            }
        }
        goto render;
    }
    if (wasClicked.ptr != 0 &&
        (wasClicked.ptr->flags & FLAGS_MOVE) &&
        mouse_x >= win_x &&
        mouse_y >= win_y &&
        mouse_x <= (win_x + wasClicked.ptr->width) &&
        mouse_y <= (win_y + wasClicked.ptr->height + WINDOW_BAR_HEIGHT))
    {
    trigger_event_move:
        window_events_trigger_move(wasClicked.ptr, mouse_x - win_x, mouse_y - win_y - WINDOW_BAR_HEIGHT);
    render:
        window_renderAll(0, 0); // todo: optimize this to only render the windows that we affected
    }
}

int8_t window_awaiting_mouseUp = 0;

void window_checkClick(int32_t click_x, int32_t click_y, int8_t type)
{
    window_t *wc = wasClicked.ptr;
    if (type == 1) // mouse irq type click
    {
        if (wc != 0 && // if you clicked the selected window
            click_x >= wc->x &&
            click_y >= wc->y &&
            click_x <= (wc->x + wc->width) &&
            click_y <= (wc->y + wc->height + WINDOW_BAR_HEIGHT))
        {
            windowIsSelected = 1;
            wasClicked = (window_selected_t){
                .outOfBar = click_y > (wc->y + WINDOW_BAR_HEIGHT),
                .resize = click_x > (wc->x + wc->width - WINDOW_RESIZE_AREA) && click_y > (wc->y + wc->height + WINDOW_BAR_HEIGHT - WINDOW_RESIZE_AREA),
                .x = click_x,
                .y = click_y,
                .ptr = wc,
                .win = *wc,
            };
            if (click_y <= wc->y + WINDOW_BAR_HEIGHT) // in white bar on top
            {
                if (click_x > wc->x + wc->width - 60) // if clcking X to close window
                {
                    windowIsSelected = 0;
                    wasClicked.ptr = 0;
                    gfx_fillRect_col(wc->x, wc->y, wc->width, wc->height + WINDOW_BAR_HEIGHT, desktop_background_color);
                    linked_remove(&allWindows, -1);
                    window_renderAll(click_x, click_y);
                    return;
                }
                // todo, maximize and minimize buttons here
            }
            else if (wc->event != 0 && (wc->flags & FLAGS_CLICK)) // if clicked in window and evnt handler
            {
                window_awaiting_mouseUp = 1;
            }
            window_render(wc, click_x, click_y);
            return;
        }
        linked_raw_t *current = allWindows;
        int final = -1;
        int index = 0;
        window_t *window;
        while (current != 0) // for each window
        {
            window = (window_t *)current->item;
            if (
                click_x >= window->x &&
                click_y >= window->y &&
                click_x <= (window->x + window->width) &&
                click_y <= (window->y + window->height + WINDOW_BAR_HEIGHT))
            {
                final = index;
                if (click_y <= window->y + WINDOW_BAR_HEIGHT) // in white bar on top
                {
                    if (click_x > window->x + window->width - 60) // if clcking X to close window
                    {
                        windowIsSelected = 0;
                        wasClicked.ptr = 0;
                        gfx_fillRect_col(window->x, window->y, window->width, window->height + WINDOW_BAR_HEIGHT, desktop_background_color);
                        linked_remove(&allWindows, final);
                        window_renderAll(click_x, click_y);
                        return;
                    }
                    // todo, maximize and minimize buttons here
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

            // get last window
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

            window_render(window, click_x, click_y);
        }
        else
        {
            windowIsSelected = 0;
            wasClicked.ptr = 0;
        }
    }
    else // mouse irq type release click
    {
        if (window_awaiting_mouseUp)
        { 
            int32_t relcx = click_x - wc->x;
            int32_t relcy = click_y - wc->y;
            widget_handleAllInput(wc, EVENT_CLICK, relcx, relcy);
            window_events_trigger_click(wc, relcx, relcy);
            window_awaiting_mouseUp = 0;
        }
        windowIsSelected = 0;
    }
}

void window_checkKey(char key)
{
    window_t *window = wasClicked.ptr;
    if (window != 0 && (window->flags & FLAGS_KEYP))
    {
        widget_handleAllInput(window, EVENT_KEYP, 0, 0);
        window_events_trigger_keyp(window, key);
        window_render_and_swap(window, 0, 0);
    }
}