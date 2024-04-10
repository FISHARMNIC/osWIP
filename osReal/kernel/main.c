/*
CLICKING IN THE GREEN TEXT AREA FIXES ISSUE
*/


#include <stdint.h>

#include "../libs/asm/include.h"
#include "../libs/sys/include.h"
#include "../libs/display/include.h"
#include "../libs/interrupts/include.h"
#include "../libs/input/include.h"
#include "../libs/exec/include.h"
#include "../libs/disk/include.h"

#include "../libs/syscalls/include.h"

#include "desktop/include.h"

//uint16_t data[500] = {'A','B','C','D'};

void kern_postBootSequence()
{
    gfx_init_ctx(&gfx_current_ctx, 0, COL_GREEN_MAX, 0);    // init current graphics context
    tty_init_ctx(0,0,65,&gfx_current_ctx,&tty_current_ctx); // init current teletype context
    
    tty_putString("==Finishing boot==\n");

    mouse_init();
    gfx_mouse_current_glpyh = MOUSE_FONT_REG;
    tty_putString("... Mouse installed\n");

    timer_init(200);

    idt_load_stubs();                                       // load all idt stubs (defined in boot.s)
    idt_load_interrupt(IRQ_KEYBOARD, keyboard_handler);                // load custom interrupt
    idt_load_interrupt(IRQ_TIMER, timer_callback);
    idt_load_interrupt(IRQ_MOUSE, mouse_handler);
    tty_putString("... Interrupts ready\n");

    pic_remap();                                            // move irq -> vector 32+
    
    //pic_enable_irq(IRQ_TIMER);
    pic_enable_irq(IRQ_KEYBOARD);                                      // enable irq 1
    pic_enable_irq(IRQ_CASCADE);
    pic_enable_irq(IRQ_MOUSE);

    enable_interrupts();                                    // asm sti
    tty_putString("... Interrupts active\n");

    syscalls_init();
    tty_putString("... Syscalls enabled\n");

    bpb_init();
    tty_putString("... BPB read and disk ready\n");
    //ata_send_identify(ata_idenfity_buffer);
    tty_putString("==== Hit any key to load desktop ====\n");

    mouse_render(0,0);
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
    gfx_fillRect(150,200,200,200,&gfx_current_ctx);

    getch();

    run_disk_test();

    //desktop_load();

    return;
}