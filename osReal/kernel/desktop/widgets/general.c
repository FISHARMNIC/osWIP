void widget_append(window_t *window, int type, void *widget, uint32_t x, uint32_t y)
{
    widget_general_t *general = (widget_general_t *)malloc(sizeof(widget_general_t));
    *general = (widget_general_t){
        .x = x,
        .y = y,
        .type = type,
        .widget = widget,
    };
    linked_add(&(window->widgets), general);
}

void widget_drawAll(window_t* window)
{
    linked_raw_t* current = window->widgets;
    widget_general_t* widget_gen;
    while (current != 0)
    {
        widget_gen = (widget_general_t*)(current->item);
        if(widget_gen->type == WIDGET_TEXT)
        {
            widget_text_render(window, (widget_text_t*)(widget_gen->widget), widget_gen->x, widget_gen->y);
        }
        current = (linked_t)current->next;
    }
}