#include <stdint.h>

#include "../libs/VGA_640_480_16/include.c"
#include "../libs/interrupts/interrupt.h"
#include "../libs/input/input.h"
#include "../libs/interrupts/timer.h"

void kernel_entry()
{
    SYS_vga_text_fmt = (SYS_vga_text_fmt_t){
        .char_spacing = 10,
        .color_bg = 0,
        .color_fg = (COL_RED_MAX << (6 + 5)) | (COL_GREEN_MAX << 5) | COL_BLUE_MAX
    };

    idt_init();
    
    //mouse_init();
    //idt_set_custom(12, mouse_handler); 
    idt_set_custom(1, keyboard_handler);
    
    PIC_remap();
    enable_interrupts();
    
    enable_irq(1);
    // triggering irq 0, should that be 32 and the pic is not being remapped?
    // clicking key triggers fault 1, should be irq 1. Only works once since buffer is not being read and EOI not sent.

    puts("TEST1", 0, 50);
    puts("TEST2", 200, 70);
    puts("TEST3", 0, 90);
    puts("TEST4", 200, 110);

    while(1);

    return;
}