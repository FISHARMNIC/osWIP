int nFails = 0;
// todo, bluescreen
extern void exception_handler(struct regs32 regs) {
    gfx_drawString("000", 30,20);
    gfx_drawInt(nFails,20,40);
    gfx_drawChar('F',20,20);
    gfx_drawInt(isr_exception_type, 30, 20);
    nFails++;
    //asm volatile("cli; jmp .;");
}

extern void irq_handler(struct regs32 regs) {
    uint32_t irq = isr_exception_type - 33;
    //gfx_drawInt(irq, 300,300);
    if(idt_customs[irq] != 0)
    {
        ((func_t*)(idt_customs[irq]))();
    }
    PIC_sendEOI(irq);
}

void idt_load_interrupt(uint8_t vector, void* isr)
{
    idt_customs[vector] = isr;
}

void idt_set_gate(uint8_t vector, void* isr, uint8_t flags) {
    idt_entry_t* descriptor = &idt[vector];
 
    descriptor->isr_low        = (uint32_t)isr & 0xFFFF;
    descriptor->kernel_cs      = _CODE_SEG; //0x08; // this value can be whatever offset your kernel code selector is in your GDT
    descriptor->reserved       = 0;
    descriptor->attributes     = flags;
    descriptor->isr_high       = ((uint32_t)isr >> 16) & 0xFFFF;
}

extern uint32_t* isr_stub_table[];

static idtr_t idtr;

void idt_load_stubs() {
    idtr.base = (uint32_t)&idt[0];
    idtr.limit = (uint16_t)sizeof(idt_entry_t) * IDT_MAX_DESCRIPTORS - 1;

    //static uint8_t vectors[47];
    uint8_t vector = 0;
    for (; vector < 32; vector++) {
        idt_set_gate(vector, isr_stub_table[vector], 0x8E);
        idt_customs[vector] = 0;
    }

    for (vector = 32; vector < 48; vector++) {
        idt_set_gate(vector, isr_stub_table[vector], 0x8E);
    }

    __asm__ volatile ("lidt %0" : : "m"(idtr)); // load the new IDT
}

void enable_interrupts()
{
    __asm__ volatile ("sti;");
}

void disable_interrupts()
{
    __asm__ volatile ("cli;");
}