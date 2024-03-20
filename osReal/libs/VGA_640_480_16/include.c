#pragma once

#include <stdint.h>
#include "../ports/ports.h"
#include "defs.h"
#include "font.h"
#include "../sys_lib/numbers.c"

/// @brief Put pixel at (x,y) using 16 bit r:g:b/5:6:5 color
/// @param col r:g:b/5:6:5 color
static inline void SYS_put_pixel(uint16_t col, int x, int y)
{
    VGARAM[x + y * SCREEN_WIDTH] = col;
}

/// @brief Put pixel at (x,y) using the system configuration for text color
static void SYS_put_pixel_conf(int x, int y)
{
    VGARAM[x + y * SCREEN_WIDTH] = SYS_vga_text_fmt.color_fg;
}

// from osdev
/// @brief Put character using loaded font with a background color
/// @param character character for printing
void VGA_drawchar_highlight(unsigned char character, int x, int y, int fgcolor, int bgcolor)
{
    int cx, cy;
    int mask[8] = {1, 2, 4, 8, 16, 32, 64, 128};
    
    uint8_t *glyph = (uint8_t*)((int)VGA_FONT + (int)character * 16);

    for (cy = 0; cy < 16; cy++)
    {
        for (cx = 1; cx < 8; cx++)
        {
            SYS_put_pixel((glyph[cy] & mask[8 - cx]) ? fgcolor : bgcolor, x + cx, y + cy - 12);
        }
    }
}

/// @brief VGA_drawchar_highlight using system text config
static inline void VGA_drawchar_highlight_conf(unsigned char character, int x, int y)
{
    VGA_drawchar_highlight(character, x, y, SYS_vga_text_fmt.color_fg, SYS_vga_text_fmt.color_bg);
}

/// @brief VGA_drawchar_highlight without background color (transparent)
void VGA_drawchar(unsigned char character, int x, int y, int col)
{
    int cx, cy;
    int mask[8] = {1, 2, 4, 8, 16, 32, 64, 128};
    
    uint8_t *glyph = VGA_FONT + (int)character * 16;

    for (cy = 0; cy < 16; cy++)
    {
        for (cx = 0; cx < 8; cx++)
        {
            if(glyph[cy] & mask[8 - cx]) 
                SYS_put_pixel_conf(x + cx, y + cy - 12);
        }
    }
}

/// @brief VGA_drawchar using system text config
static inline void VGA_drawchar_conf(unsigned char character, int x, int y)
{
    VGA_drawchar(character, x, y, SYS_vga_text_fmt.color_fg);
}

// =============================== STDOUT ====================================

static inline void putch(char character, int x, int y)
{
    VGA_drawchar_highlight_conf(character, x, y);
}

void puts(char * string, int x, int y)
{
    char current;
    int index = 0;
    do {
        current = string[index];
        putch(current, x + (index * SYS_vga_text_fmt.char_spacing), y);
        index++;
    }  while(current != 0);
}

void puti(uint32_t number, int x, int y)
{
    int char_spacing = SYS_vga_text_fmt.char_spacing;

    int len = numLen(number) - 1;
    x += len * char_spacing;
    if (number == 0) {
        putch('0', x, y);
    }
    else
    {
        while (number >= 1)
        {
            putch((char)(number % 10) + 48, x, y);
            number /= 10;
            x -= char_spacing;
        }
    }
}