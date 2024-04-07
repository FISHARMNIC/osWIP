void myputs_test(char* str)
{
    asm("mov $0, %eax; int $49");
}