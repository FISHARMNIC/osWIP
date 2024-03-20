#include <stdint.h>

#include "../libs/display/include.h"
#include "../libs/interrupts/include.h"
#include "../libs/input/include.h"

void kern_postBootSequence()
{
    gfx_init_ctx(&gfx_current_ctx, COL_RED_MAX, COL_GREEN_MAX, COL_BLUE_MAX);   // init current graphics context
    tty_init_ctx(0,0,80,&gfx_current_ctx,&tty_current_ctx);                     // init current teletype context
    
    tty_putString("Beginning post-boot\n");

    mouse_init();

    idt_load_stubs();                                       // load all idt stubs (defined in boot.s)
    idt_load_interrupt(1, keyboard_handler);                // load custom interrupt
    //idt_load_interrupt(12, mouse_handler);
    tty_putString("...Interrupts ready\n");

    pic_remap();                                            // move irq -> vector 32+
    pic_enable_irq(1);                                      // enable irq 1
    //pic_enable_irq(12);
    enable_interrupts();                                    // asm sti
    tty_putString("...Interrupts active\n");
    tty_putString("==== Hit ENTER to load desktop ====\n");

}

void kernel_entry()
{

    // triggering irq 0, should that be 32 and the pic is not being remapped?
    // clicking key triggers fault 1, should be irq 1. Only works once since buffer is not being read and EOI not sent.
    kern_postBootSequence();

    tty_putString("TEST1\n");
    tty_putString("TEST2\n");
    tty_putString("TEST3\n");
    tty_putString("TEST4\n");

    while(1);

    return;
}