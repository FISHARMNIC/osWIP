#pragma once

#include <stdint.h>
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

#define ICW1_ICW4 0x01      /* Indicates that ICW4 will be present */
#define ICW1_SINGLE 0x02    /* Single (cascade) mode */
#define ICW1_INTERVAL4 0x04 /* Call address interval 4 (8) */
#define ICW1_LEVEL 0x08     /* Level triggered (edge) mode */
#define ICW1_INIT 0x10      /* Initialization - required! */
#define PIC1 0x20 /* IO base address for master PIC */
#define PIC2 0xA0 /* IO base address for slave PIC */
#define OFFSET_PIC1 20
#define OFFSET_PIC2 (OFFSET_PIC1 + 8)
#define PIC1_COMMAND PIC1
#define PIC1_DATA (PIC1 + 1)
#define PIC2_COMMAND PIC2
#define PIC2_DATA (PIC2 + 1)
#define PIC_EOI 0x20
#define PIC1_START_INTERRUPT 0x20
#define PIC2_START_INTERRUPT 0x28
#define PIC2_END_INTERRUPT PIC2_START_INTERRUPT + 7
#define PIC_ACK 0x20

#include "../display/include.h"
#include "../ports/include.h"
#include "pic.c"
#include "idt.c"
#include "timer.c"
