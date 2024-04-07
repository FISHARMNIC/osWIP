void _syscall_puts(regs32 registers)
{
    gfx_drawString("hello, testing syscall", 20, 20);
}