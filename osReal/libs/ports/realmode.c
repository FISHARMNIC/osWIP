
struct GDTEntry
{
    unsigned short limit_low;
    unsigned short base_low;
    unsigned char base_middle;
    unsigned char access;
    unsigned char granularity;
    unsigned char base_high;
};


static void switch_to_real_mode(unsigned int gdt_address)
{
    struct
    {
        unsigned short size;
        unsigned int offset;
    } __attribute__((packed)) gdtr = { .size = sizeof(struct GDTEntry) * 2 - 1, .offset = gdt_address };

    unsigned int temp_gdtr = (unsigned int)&gdtr;

     asm volatile (
        // Disable interrupts
        "cli\n"

        // Load the real mode Global Descriptor Table (GDT) descriptor
        "lgdt %0\n"

        // Set CR0 to enable real mode
        "movl %%cr0, %%eax\n"
        "andl $0x7FFFFFFF, %%eax\n"
        "movl %%eax, %%cr0\n"

        // Far jump to real mode code segment
        "ljmp $0x08, $1f\n"
        "1:\n"
        "sti"
        :
        : "m"(gdtr)
        : "eax"
    );
}