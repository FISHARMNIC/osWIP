enum {
    WIDGET_TEXT,
    WIDGET_INPUT,
    WIDGET_TOTAL_TYPES // MUST BE LAST
};

typedef struct
{
    uint32_t x;
    uint32_t y;
    
    int type;
    void* widget;
} widget_general_t;

#define WIDGET_REQUIRED_ITEMS widget_general_t* info; gfx_ctx_t *ctx

typedef struct
{
    WIDGET_REQUIRED_ITEMS;
} widget_template_t;

typedef void widget_renderFn_t(window_t*, void*, uint32_t, uint32_t);
typedef int widget_handlerFn_t(window_t*, void*, uint32_t, uint32_t, int32_t, int32_t);

void window_render(window_t *window, int32_t rel_click_x, int32_t rel_click_y);
void window_render_and_swap(window_t *window, int32_t rel_click_x, int32_t rel_click_y);

#include "text.c"
#include "input.c"
#include "general.c"