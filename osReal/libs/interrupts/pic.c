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

void pic_disable_irq(unsigned char irq_num)
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

void pic_enable_irq(unsigned char irq_num)
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

void pic_remap()
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
