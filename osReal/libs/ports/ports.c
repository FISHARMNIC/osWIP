uint8_t inb(uint16_t port)
{
    int8_t ret;
    asm volatile("inb %1, %0"
                 : "=a"(ret)
                 : "d"(port));
    return ret;
}

uint16_t inw(uint16_t port)
{
    uint16_t ret;
    asm volatile("inw %1, %0"
                 : "=a"(ret)
                 : "d"(port));
    return ret;
}

void ioWait()
{
    for(int i = 0; i < 100; i++)
        asm volatile("nop");
}

void outb(uint16_t port, uint8_t data)
{
    asm volatile("outb %0, %1"
                 : 
                 : "a"(data), "d"(port));
}

void outl(uint16_t port, uint32_t data)
{
    asm volatile("outl %0, %1"
                :
                 : "a"(data), "d"(port));
}

void outw(uint16_t port, uint32_t data)
{
    asm volatile("out %0, %1"
                :
                : "a"(data), "d"(port));
}