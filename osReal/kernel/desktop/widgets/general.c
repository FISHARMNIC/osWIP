widget_renderFn_t*   allWidgetRenders[WIDGET_TOTAL_TYPES];
widget_handlerFn_t* allWidgetHandlers[WIDGET_TOTAL_TYPES];

void* selectedElement; // can be an input field etc.

#define widget_init_single(label, render, handle) allWidgetRenders[label] = (widget_renderFn_t*) render; allWidgetHandlers[label] = (widget_handlerFn_t*) handle;

void widget_append(window_t *window, int type, void *widget, uint32_t x, uint32_t y)
{
    widget_general_t *general = (widget_general_t *)malloc(sizeof(widget_general_t));
    *general = (widget_general_t){
        .x = x,
        .y = y,
        .type = type,
        .widget = widget,
    };
    ((widget_template_t*)widget)->info = general;
    linked_add(&(window->widgets), general);
}

void widget_initRenderFns()
{
    //                     TYPE            RENDER FN            HANDLER
    widget_init_single(WIDGET_TEXT,  widget_text_render,                     0);
    widget_init_single(WIDGET_INPUT, widget_input_render, widget_input_handler);
}

void widget_drawAll(window_t* window, int32_t click_x, int32_t click_y)
{
    linked_raw_t* current = window->widgets;
    widget_general_t* widget_gen;
    while (current != 0)
    {
        widget_gen = (widget_general_t*)(current->item);
        (allWidgetRenders[widget_gen->type])(window, widget_gen->widget, widget_gen->x, widget_gen->y);
        current = (linked_t)current->next;
    }
}

void widget_handleAllInput(window_t* window, int type, int32_t mouse_x, int32_t mouse_y)
{
    linked_raw_t* current = window->widgets;
    widget_general_t* widget_gen;
    uint8_t render = 0;
    while (current != 0)
    {
        widget_gen = (widget_general_t*)(current->item);
        widget_handlerFn_t* handler = allWidgetHandlers[widget_gen->type];
        if(handler != 0){
            render |= (handler)(window, widget_gen->widget, widget_gen->x, widget_gen->y, mouse_x, mouse_y);
            // set render to 1 if any function requests it
        }
        current = (linked_t)current->next;
    }
    if(render != 0)
    {
        window_render_and_swap(window, mouse_x, mouse_y);
    }
}