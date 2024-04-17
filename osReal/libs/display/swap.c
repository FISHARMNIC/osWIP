static inline void gfx_db_begin()
{
    VGARAM = (uint16_t *)VGA_BACKBUFFER;
}

static inline void gfx_db_end()
{
    VGARAM = (uint16_t *)VGA_ADDRESS;
}

void gfx_db_swap()
{
    for(int i = 0; i < SCREEN_WIDTH * SCREEN_HEIGHT; i++)
    {
        *((uint16_t*) VGA_ADDRESS + i) = VGA_BACKBUFFER[i];
    }
}