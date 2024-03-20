//https://forum.osdev.org/viewtopic.php?f=15&t=31521

#include <stdint.h>

#define SCREEN_WIDTH 640
#define SCREEN_HEIGHT 480
#define VGA_ADDRESS 0xfd000000 //run "lspci -i" on grub console to get addr (0xe0000000 for vbox)

// green gets 6 bits, red and blue only get 5
#define COL_RED_MAX 31
#define COL_BLUE_MAX COL_RED_MAX
#define COL_GREEN_MAX 63

typedef struct {
    int color_fg;
    int color_bg;
    int char_spacing;
} SYS_vga_text_fmt_t;

SYS_vga_text_fmt_t SYS_vga_text_fmt;

uint16_t *VGARAM = (uint16_t *)VGA_ADDRESS;
