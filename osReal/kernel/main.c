/*
CLICKING IN THE GREEN TEXT AREA FIXES ISSUE
*/


#include <stdint.h>

#include "../libs/sys/include.h"

#include "../libs/display/include.h"
#include "../libs/interrupts/include.h"
#include "../libs/input/include.h"
#include "../libs/disk/include.h"
#include "desktop/include.h"

uint16_t data[500] = {'A','B','C','D'};

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

    //ata_send_identify(ata_idenfity_buffer);
    tty_putString("==== Hit any key to load desktop ====\n");

    mouse_render(0,0);
}


// look into Interesting information returned by IDENTIFY on ATA PIO osdev
void run_disk_test()
{
    gfx_clearRect(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    gfx_init_ctx(&gfx_current_ctx, COL_RED_MAX, COL_GREEN_MAX, COL_BLUE_MAX);
    tty_init_ctx(0, 0, 65, &gfx_current_ctx, &tty_current_ctx);

    tty_putString("RUNNING DISK TEST-\n");
    
    uint8_t buffer[512];
    // Volume sector 0, located at 1MB (in fat_32)
    ata_read_sector_u8(buffer, 2048);

    bpb_t* bootRecord = (bpb_t* )(buffer);
    tty_putString_nl(bootRecord->BS_OEMName);
    tty_putInt_nl((uint32_t) bootRecord->BPB_BytsPerSec);
    tty_putInt_nl((uint32_t) bootRecord->BPB_SecPerClus);
    tty_putInt_nl((uint32_t) bootRecord->BPB_RsvdSecCnt); // should be 32
    tty_putInt_nl((uint32_t) bootRecord->BPB_NumFATs); // should be 2
    tty_putInt_nl((uint32_t) bootRecord->BPB_RootEntCnt); // should be 0
    tty_putInt_nl((uint32_t) bootRecord->BPB_TotSec32);

    //tty_putInt_nl((int) buffer[255] & 0xFF);
    //tty_putInt_nl((int) buffer[255] >> 8 );
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