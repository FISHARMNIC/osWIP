typedef struct
{
    char* text;
    gfx_ctx_t* ctx;
} widget_text_t;


enum {
    WIDGET_TEXT
};

typedef struct
{
    uint32_t x;
    uint32_t y;
    
    int type;
    void* widget;
} widget_general_t;

#include "text.c"
#include "general.c"