void window_events_trigger_expose(window_t *window)
{
    static window_event_expose_t event;
    if (window->event != 0)
    {
        event = (window_event_expose_t){
            .type = EVENT_EXPOSE,
            .window = window,
        };
        ((window_event_fn *)(window->event))((window_event_t *)(&event));
    }
}

void window_events_trigger_move(window_t *window, int32_t mouse_x, int32_t mouse_y)
{
    static window_event_move_t event;
    if (window->event != 0)
    {
        event = (window_event_move_t){
            .window = window,
            .type = EVENT_MOVE,
            .mouse_x = mouse_x,
            .mouse_y = mouse_y,
        };
        ((window_event_fn *)(window->event))((window_event_t *)(&event));
    }
}

void window_events_trigger_click(window_t *window, int32_t mouse_x, int32_t mouse_y)
{
    static window_event_click_t event;
    if (window->event != 0)
    {
        event = (window_event_move_t){
            .window = window,
            .type = EVENT_CLICK,
            .mouse_x = mouse_x,
            .mouse_y = mouse_y,
        };
        ((window_event_fn *)(window->event))((window_event_t *)(&event));
    }
}

void window_events_trigger_keyp(window_t *window, char key)
{
    static window_event_keyp_t event;
    if (window->event != 0)
    {
        event = (window_event_keyp_t){
            .window = window,
            .type = EVENT_KEYP,
            .key = key
        };
        ((window_event_fn *)(window->event))((window_event_t *)(&event));
    }
}
