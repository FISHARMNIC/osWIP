
void pic_acknowledge(unsigned int interrupt)
{
    if (interrupt < OFFSET_PIC1 || interrupt > PIC2_END_INTERRUPT)
    {
        return;
    }

    if (interrupt < OFFSET_PIC2)
    {
        outb(PIC1, PIC_ACK);
    }
    else
    {
        outb(PIC2, PIC_ACK);
    }
}

void PIC_sendEOI(unsigned char irq)
{
    if (irq >= 8) {
        outb(PIC2_COMMAND, PIC_EOI);
    }
    outb(PIC1_COMMAND, PIC_EOI);
}

// disable and enable are not my code
void pic_disable_irq(unsigned char irq_num)
{
    unsigned char irq_bit, pic_mask;

    if (irq_num <= 7)
        pic_mask = inb(PIC1_DATA);
    else
        pic_mask = inb(PIC2_DATA);

    irq_bit = 1 << (irq_num % 8);

    pic_mask = irq_bit | pic_mask;

    if (irq_num <= 7)
        outb(PIC1_DATA, pic_mask);
    else
        outb(PIC2_DATA, pic_mask);
}

void pic_enable_irq(unsigned char irq_num)
{
    unsigned char irq_bit, pic_mask;

    if (irq_num <= 7)
        pic_mask = inb(PIC1_DATA);
    else
        pic_mask = inb(PIC2_DATA);

    irq_bit = ~(1 << (irq_num % 8));

    pic_mask = irq_bit & pic_mask;

    if (irq_num <= 7)
        outb(PIC1_DATA, pic_mask);
    else
        outb(PIC2_DATA, pic_mask);
}

void pic_remap()
{
    outb(PIC1_COMMAND, 0x11);
    outb(PIC2_COMMAND, 0x11);

    outb(PIC1_DATA, 0x20);
    outb(PIC2_DATA, 0x28);

    outb(PIC1_DATA, 4);
    outb(PIC2_DATA, 2);

    outb(PIC1_DATA, 0x1);
    outb(PIC2_DATA, 0x1);

    outb(0x21, 0xFF);
    outb(0xA1, 0xFF);
}
