static linked_t allWindows; // todo: malloc

void window_render(window_t* window)
{
    gfx_fillRect(window->x, window->y, window->width, window->height, &window->window_ctx);
}

void window_renderAll()
{
    linked_t current = allWindows;
    while(current != 0)
    {
        window_render((window_t*) current->item);
        current = (linked_t) current->next;
    }
}

void window_create(window_t* window)
{
    linked_add(&allWindows, (void*)window);
}

void window_checkClick(int32_t click_x, int32_t click_y)
{
    linked_raw_t * current = allWindows;
    int final = -1;
    int index = 0;
    while(current != 0)
    {
        window_t* window = (window_t*) current->item;
        if(
            click_x >= window->x && 
            click_y >= window->y && 
            click_x <= (window->x + window->width) &&
            click_y <= (window->y + window->height)
        )
        {
            final = index;
        }
        current = (linked_raw_t *) current->next;
        index++;
    }
    if(final != -1 && final != (index - 1)) // if click on a window and its not the last window
    {
        tty_putChar('-');
        linked_moveToEnd(&allWindows, final);
        window_renderAll();
    }
}