void myputs_test(char * s)
{
    asm volatile("mov $0, %%eax; mov %0, %%esi; mov %1, %%edx; int $49"
    :: "g" (s), "g" (__DATA_SEGMENT_OFFSET__)
    : "%eax", "%esi", "%edx");
}

void myputi_test(int i)
{
    asm volatile("mov $1, %%eax; mov %0, %%esi; mov %1, %%edx; int $49"
    :: "g" (i), "g" (__DATA_SEGMENT_OFFSET__)
    : "%eax", "%esi", "%edx");
}