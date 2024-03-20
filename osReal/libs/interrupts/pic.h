#include "../ports/ports.h"
#include <stdint.h>

#define ICW1_ICW4 0x01      /* Indicates that ICW4 will be present */
#define ICW1_SINGLE 0x02    /* Single (cascade) mode */
#define ICW1_INTERVAL4 0x04 /* Call address interval 4 (8) */
#define ICW1_LEVEL 0x08     /* Level triggered (edge) mode */
#define ICW1_INIT 0x10      /* Initialization - required! */

#define ICW4_8086 0x01       /* 8086/88 (MCS-80/85) mode */
#define ICW4_AUTO 0x02       /* Auto (normal) EOI */
#define ICW4_BUF_SLAVE 0x08  /* Buffered mode/slave */
#define ICW4_BUF_MASTER 0x0C /* Buffered mode/master */
#define ICW4_SFNM 0x10       /* Special fully nested (not) */

#define PIC1 0x20 /* IO base address for master PIC */
#define PIC2 0xA0 /* IO base address for slave PIC */
#define OFFSET_PIC1 20
#define OFFSET_PIC2 (OFFSET_PIC1 + 8)
#define PIC1_COMMAND PIC1
#define PIC1_DATA (PIC1 + 1)
#define PIC2_COMMAND PIC2
#define PIC2_DATA (PIC2 + 1)

#define PIC_EOI 0x20 /* End-of-interrupt command code */

/* The PIC interrupts have been remapped */
#define PIC1_START_INTERRUPT 0x20
#define PIC2_START_INTERRUPT 0x28
#define PIC2_END_INTERRUPT PIC2_START_INTERRUPT + 7

#define PIC_ACK 0x20

/** pic_acknowledge:
 *  Acknowledges an interrupt from either PIC 1 or PIC 2.
 *
 *  @param num The number of the interrupt
 */
void pic_acknowledge(unsigned int interrupt)
{
    if (interrupt < PIC1_START_INTERRUPT || interrupt > PIC2_END_INTERRUPT)
    {
        return;
    }

    if (interrupt < PIC2_START_INTERRUPT)
    {
        outb(PIC1, PIC_ACK);
    }
    else
    {
        outb(PIC2, PIC_ACK);
    }
}

/* reinitialize the PIC controllers, giving them specified vector offsets
   rather than 8h and 70h, as configured by default */

void PIC_sendEOI(unsigned char irq)
{
    if (irq >= 8)
        outb(PIC2_COMMAND, PIC_EOI);
    outb(PIC1_COMMAND, PIC_EOI);
}

#define PORT_8259M 0x20
#define PORT_8259S 0xA0

#define PORT_8259_IMR_M 0x21
#define PORT_8259_IMR_S 0xA1

void disable_irq(unsigned char irq_num)
{
    unsigned char irq_bit, pic_mask;

    // read the current mask
    if (irq_num <= 7)
        pic_mask = inb(PORT_8259_IMR_M);
    else
        pic_mask = inb(PORT_8259_IMR_S);

    // set the apropriate bit 1 - disable 0 enable
    irq_bit = 1 << (irq_num % 8);

    pic_mask = irq_bit | pic_mask;

    // write to pic controler
    if (irq_num <= 7)
        outb(PORT_8259_IMR_M, pic_mask);
    else
        outb(PORT_8259_IMR_S, pic_mask);
}

void enable_irq(unsigned char irq_num)
{
    unsigned char irq_bit, pic_mask;

    // read the current mask
    if (irq_num <= 7)
        pic_mask = inb(PORT_8259_IMR_M);
    else
        pic_mask = inb(PORT_8259_IMR_S);

    // clear the apropriate bit
    irq_bit = ~(1 << (irq_num % 8));

    pic_mask = irq_bit & pic_mask;

    // write to pic controler
    if (irq_num <= 7)
        outb(PORT_8259_IMR_M, pic_mask);
    else
        outb(PORT_8259_IMR_S, pic_mask);
}

void PIC_remap()
{
    outb(PIC1_COMMAND, ICW1_INIT | ICW1_ICW4); // starts the initialization sequence (in cascade mode)
    outb(PIC2_COMMAND, ICW1_INIT | ICW1_ICW4);

    outb(PIC1_DATA, 0x20);
    outb(PIC2_DATA, 0x28);

    outb(PIC1_DATA, 4);
    outb(PIC2_DATA, 2);

    outb(PIC1_DATA, 0x1);
    outb(PIC2_DATA, 0x1);

    outb(0x21, 0xFF);
    outb(0xA1, 0xFF);

    /*
        for (int i = 0; i < 13; i++)
    {
        disable_irq(i);
    }
    */
}
