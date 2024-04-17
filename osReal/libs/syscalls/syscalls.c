interrupt_fn_t* syscalls[256];

void syscall_create(interrupt_fn_t* fn, uint32_t index)
{
    syscalls[index] = fn;
}


void syscall(regs32 r)
{
    syscalls[r.eax](r);
}


void syscalls_init()
{
    syscall_create(_syscall_puts, SYSCALL_PUTS);
    syscall_create(_syscall_puti, SYSCALL_PUTI);
    
    idt_load_interrupt(SYSCALLS_IRQ_ENTRY, syscall);
}