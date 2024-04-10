void myputs_test()
{
    asm volatile("mov $0, %eax; int $49");
    // asm("mov %0, %%eax; int $49"
    // :
    // : "r" (str)
    // : "%eax"
    // );
}

void myputi_test(int i)
{
    asm("mov %0, %%eax; int $49"
    :
    : "r" (i)
    : "%eax"
    );
}