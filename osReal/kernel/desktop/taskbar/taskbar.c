static taskbar_info_t taskbar_data = (taskbar_info_t) {
    .width = SCREEN_WIDTH - 50,
    .height = 50,
    .x = ((SCREEN_WIDTH / 2) - ((SCREEN_WIDTH - 50) / 2)),
    .y = (SCREEN_HEIGHT - (50) - 10),
};

void taskbar_adjust(uint32_t width, uint32_t height)
{
    taskbar_data = (taskbar_info_t){
        .width = width,
        .height = height,
        .x = ((SCREEN_WIDTH / 2) - (width / 2)),
        .y = (SCREEN_HEIGHT - (height) - 10)
    };
}

void taskbar_render()
{
    gfx_fillBorderedRect_col(taskbar_data.x, taskbar_data.y, taskbar_data.width, taskbar_data.height, COLOR_ENV_GREEN(10), 0, 1);
}