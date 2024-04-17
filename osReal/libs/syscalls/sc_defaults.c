void _syscall_puts(regs32 registers)
{
    // esi: string
    tty_putString_nl("SYS PUTS CALLED");
    tty_putString("data segment : ");
    tty_putInt_nl(registers.edx);
    tty_putString("string offset: ");
    tty_putInt_nl(registers.esi);
    tty_putString("TEXT: ");
    tty_putString_nl(DATA_SEGMENT(registers.esi, registers, char*));
}

void _syscall_puti(regs32 registers)
{
    // esi: number
    tty_putString("SYS PUTI CALLED: ");
    tty_putInt_nl(registers.esi);
}