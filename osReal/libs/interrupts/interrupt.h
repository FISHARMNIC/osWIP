// cannot move new irq directly in. It must go through the whole process that stud does
// instead check int. no

// from osdev
#pragma once
#include "pic.h"
#include "../VGA_640_480_16/include.c"

#define IDT_MAX_DESCRIPTORS 256

extern char gdt_code;
extern char gdt_start;
extern int _CODE_SEG;

#define CODE_SEG (&gdt_code - &gdt_start)

typedef void func(void);

typedef struct {
	uint16_t    isr_low;      // The lower 16 bits of the ISR's address
	uint16_t    kernel_cs;    // The GDT segment selector that the CPU will load into CS before calling the ISR
	uint8_t     reserved;     // Set to zero
	uint8_t     attributes;   // Type and attributes; see the IDT page
	uint16_t    isr_high;     // The higher 16 bits of the ISR's address
} __attribute__((packed)) idt_entry_t;

__attribute__((aligned(0x10))) 
static idt_entry_t idt[IDT_MAX_DESCRIPTORS]; // Create an array of IDT entries; aligned for performance

void* idt_customs[32];

typedef struct {
	uint16_t	limit;
	uint32_t	base;
} __attribute__((packed)) idtr_t;

extern int8_t isr_exception_type;

struct regs32
{
    uint32_t edi, esi, ebp, esp, ebx, edx, ecx, eax; 
    uint32_t intn, errc;
    uint32_t eip, cs, eflags, usresp, ss; 
};


//__attribute__((noreturn)) 
//extern void exception_handler(void);
int nFails = 0;
extern void exception_handler(struct regs32 regs) {
    puts("000", 30,20);
    puti(nFails,20,40);
    putch('F',20,20);
    puti(isr_exception_type, 30, 20);
    nFails++;
    if(isr_exception_type == 0)
    {
        PIC_sendEOI(0); // remove
    }
}

extern void irq_handler(struct regs32 regs) {
    uint32_t irq = isr_exception_type - 33;
    puti(irq, 300,300);
    if(idt_customs[irq] != 0)
    {
        ((func*)(idt_customs[irq]))();
    }
    PIC_sendEOI(irq);
}

void idt_set_custom(uint8_t vector, void* isr)
{
    idt_customs[vector] = isr;
}

void idt_set_descriptor(uint8_t vector, void* isr, uint8_t flags) {
    idt_entry_t* descriptor = &idt[vector];
 
    descriptor->isr_low        = (uint32_t)isr & 0xFFFF;
    descriptor->kernel_cs      = _CODE_SEG; //0x08; // this value can be whatever offset your kernel code selector is in your GDT
    descriptor->reserved       = 0;
    descriptor->attributes     = flags;
    descriptor->isr_high       = ((uint32_t)isr >> 16) & 0xFFFF;
}

extern uint32_t* isr_stub_table[];

static idtr_t idtr;

void idt_init(void);
void idt_init() {
    idtr.base = (uint32_t)&idt[0];
    idtr.limit = (uint16_t)sizeof(idt_entry_t) * IDT_MAX_DESCRIPTORS - 1;

    static uint8_t vectors[47];
    uint8_t vector = 0;
    for (; vector < 32; vector++) {
        idt_set_descriptor(vector, isr_stub_table[vector], 0x8E);
        idt_customs[vector] = 0;
    }
    //PIC_init();
    for (vector = 32; vector < 48; vector++) {
        idt_set_descriptor(vector, isr_stub_table[vector], 0x8E);
    }

    __asm__ volatile ("lidt %0" : : "m"(idtr)); // load the new IDT
}

void enable_interrupts()
{
    __asm__ volatile ("sti;"); // set the interrupt flag
}