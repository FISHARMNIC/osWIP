void desktop_load()
{
    gfx_clearRect(0,0,SCREEN_WIDTH, SCREEN_HEIGHT);

    gfx_init_ctx(&gfx_current_ctx, COL_RED_MAX, COL_GREEN_MAX, COL_BLUE_MAX);
    tty_init_ctx(0,0,65,&gfx_current_ctx,&tty_current_ctx);

    window_t* window1 = malloc(sizeof(window_t)); 
    window_t* window2 = malloc(sizeof(window_t)); 
    window_t* window3 = malloc(sizeof(window_t)); 

    *window1 = (window_t){
        .x = 50,
        .y = 50,
        .width = 100,
        .height = 100,
        .window_ctx = gfx_init_ctx_rtrn(COL_RED_MAX, 0, 0)
    };
    window_create(window1);

    *window2 = (window_t){
        .x = 100,
        .y = 100,
        .width = 100,
        .height = 100,
        .window_ctx = gfx_init_ctx_rtrn(0, COL_GREEN_MAX, 0)
    };
    window_create(window2);

    *window3 = (window_t){
        .x = 150,
        .y = 150,
        .width = 100,
        .height = 100,
        .window_ctx = gfx_init_ctx_rtrn(0, 0, COL_BLUE_MAX)
    };
    window_create(window3);

    linked_moveToEnd(&allWindows, 0);


    mouse_onClick(window_checkClick);
    window_renderAll();

    // SEEBUFFERS IN CRPROJ. COPY THAT
}