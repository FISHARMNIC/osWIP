// number 6 not working sometimes, try using static alloc buffer to see if malloc broken 
char* counter_string;
uint32_t counter = 1;

widget_text_t *text1;

window_t *window1;
window_t *window2;

void test_windowEvent(window_event_t *event)
{
    if (event->type == EVENT_CLICK)
    {
        itoa(counter++, counter_string);
    }
}

void desktop_example()
{
    counter_string = (char*) malloc(10);
    itoa(0, counter_string);

    text1 = widget_text_create(counter_string, &GFX_DEFAULT_BLACK);

    window1 = window_create(50, 50, 200, 100, "Window 1", test_windowEvent);
    widget_append(window1, WIDGET_TEXT, text1, 15, 15);

    window2 = window_create(100, 100, 200, 100, "Window 2", 0);
}

void desktop_load()
{
    gfx_clearRect(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    gfx_init_ctx(&gfx_current_ctx, COL_RED_MAX, COL_GREEN_MAX, COL_BLUE_MAX);
    tty_init_ctx(0, 0, 65, &gfx_current_ctx, &tty_current_ctx);

    desktop_example();

    gfx_db_begin();
    mouse_onClick(window_checkClick);
    mouse_onMove(window_checkMove);
    window_renderAll();
}