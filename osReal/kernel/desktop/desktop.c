char* counter_string;
char* key_string;
char* move_string;
char* input_buffer;

int32_t counter = 0;

widget_text_t *widget_text1;
widget_text_t *widget_text2;
widget_text_t *widget_text3;

widget_input_t *input1;

window_t *window1;
window_t *window2;
window_t *window3;

void example_clickEv(window_event_t *event)
{
    if (event->type == EVENT_CLICK)
    {
        itoa(counter, counter_string);
        counter++;
    }
}

void example_keyEv(window_event_t *event)
{
    if (event->type == EVENT_KEYP)
    {
        window_event_keyp_t* kb_event = (window_event_keyp_t*) event;
        *key_string = kb_event->key;
    }
}

void example_moveEv(window_event_t *event)
{
    if (event->type == EVENT_MOVE)
    {
        window_event_move_t* move_event = (window_event_move_t*) event;
        widget_text2->info->x = move_event->mouse_x;
        widget_text2->info->y = move_event->mouse_y;
        itoa(move_event->mouse_x, move_string);
    }
}

void desktop_example()
{
    counter_string = (char*) malloc(10);
    move_string = (char*) malloc(10);
    key_string = (char*) malloc(2);
    input_buffer = (char*) malloc(10);

    *(key_string + 1) = 0;

    itoa(0, counter_string);

    widget_text1 = widget_text_create(counter_string, &GFX_DEFAULT_BLACK);
    widget_text2 = widget_text_create(move_string, &GFX_DEFAULT_BLACK);
    widget_text3 = widget_text_create(key_string, &GFX_DEFAULT_BLACK);

    input1 = widget_input_create(input_buffer, 50, &GFX_DEFAULT_BLACK);

    window3 = window_create(150, 150, 200, 100, "Click Me", example_clickEv, FLAGS_CLICK);
    widget_append(window3, WIDGET_TEXT, widget_text1, 15, 5);

    window1 = window_create(50, 50, 200, 100, "Drag Mouse", example_moveEv, FLAGS_CLICK | FLAGS_MOVE);
    widget_append(window1, WIDGET_TEXT, widget_text2, 15, 5);

    window2 = window_create(100, 100, 200, 100, "Type in Me", example_keyEv, FLAGS_CLICK | FLAGS_KEYP);
    //widget_append(window2, WIDGET_TEXT, widget_text3, 15, 5);
    widget_append(window2, WIDGET_INPUT, input1, 15, 5);

}

void desktop_load()
{
    gfx_init_ctx(&gfx_current_ctx, COL_RED_MAX, COL_GREEN_MAX, COL_BLUE_MAX);
    tty_init_ctx(0, 0, 65, &gfx_current_ctx, &tty_current_ctx);

    desktop_example();

    gfx_db_begin();
    gfx_fillRect_col(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT, desktop_background_color);
    
    wasClicked.ptr = 0;
    mouse_onClick(window_checkClick);
    mouse_onMove(window_checkMove);
    //keyboard_onPress(window_checkKey);

    widget_initRenderFns();
    window_renderAll(0,0);
}