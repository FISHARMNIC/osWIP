// VGA mode constants
#include "../ports/ports.h"
#define VGA_320x200x256 0x13

// Function to set VGA mode
// Function to set VGA mode
void setVGAMode(unsigned char mode) {
    // Disable interrupts
    asm("cli");

   outb(0x03C4, 0x03);
    outb(0x03C5, 0x01);

    // Set VGA mode 320x200x256
    outb(0x03C4, 0x04);
    outb(0x03C5, 0x0E);

    // Set memory mapping mode
    outb(0x03CE, 0x05);
    outb(0x03CF, 0x02);
    // Enable interrupts
    asm("sti");
}

