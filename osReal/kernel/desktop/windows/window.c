static linked_t allWindows; // todo: malloc

static window_t *wasClicked_ptr = 0;
static uint32_t wasClicked_x = 0;
static uint32_t wasClicked_y = 0;
static uint32_t wasClicked_taskb = 0;
static uint32_t wasClicked_winx = 0;
static uint32_t wasClicked_winy = 0;

static volatile uint8_t windowIsSelected = 0;

void window_draw(window_t *window)
{
    gfx_fillRect_col(window->x, window->y, window->width, WINDOW_BAR_HEIGHT, COLOR_GRAY(2)); // bar
    gfx_drawString_ctx("- + x", window->x + window->width - 60, window->y, (gfx_ctx_t *)&GFX_DEFAULT_BLACK);
    gfx_drawString_ctx(window->title, window->x, window->y, (gfx_ctx_t *)&GFX_DEFAULT_BLACK);
    gfx_fillRect(window->x, window->y + WINDOW_BAR_HEIGHT, window->width, window->height, &window->window_ctx);
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

window_t* window_create(uint32_t x, uint32_t y, uint32_t width, uint32_t height, char* title, window_event_fn *event)
{
    window_t* window = (window_t*) malloc(sizeof(window_t));
    *window = (window_t){
        .x = x,
        .y = y,
        .width = width,
        .height = height,
        .title = title,
        .event = (void *)event,
        .window_ctx = gfx_init_ctx_rgb_rtrn(COLOR_GRAY(10)),
    };
    linked_add(&allWindows, (void *)window);
    return window;
}

void window_checkMove(int32_t mouse_x, int32_t mouse_y)
{
    if (windowIsSelected && (mouse_x != wasClicked_x || mouse_y != wasClicked_y))
    {
        gfx_clearRect(wasClicked_ptr->x, wasClicked_ptr->y, wasClicked_ptr->width, wasClicked_ptr->height + WINDOW_BAR_HEIGHT);
        wasClicked_ptr->x = wasClicked_winx + (mouse_x - wasClicked_x);
        wasClicked_ptr->y = wasClicked_winy + (mouse_y - wasClicked_y);
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
                wasClicked_taskb = 0;
                if (click_y <= window->y + WINDOW_BAR_HEIGHT) // in taskbar
                {

                    if (click_x > window->x + window->width - 60)
                    {
                        wasClicked_taskb = 1;
                        // linked_remove(&allWindows,final);
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
            if (final == index - 1)
            {
                if (window->event != 0)
                {
                    window_event_t event = {
                        .mouse_x = mouse_x - window->x,
                        .mouse_y = mouse_y - window->y,
                        .window = window,
                        .type = EVENT_CLICK};
                    ((window_event_fn *)(window->event))(&event); // trigger ONCLICK event
                }
            }

            wasClicked_x = mouse_x;
            wasClicked_y = mouse_y;
            wasClicked_ptr = window;
            wasClicked_winx = window->x;
            wasClicked_winy = window->y;
            windowIsSelected = 1;

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
    gfx_drawInt(wasClicked_taskb, 10, 30);
}