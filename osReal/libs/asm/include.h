#pragma once

typedef struct
{
    uint32_t edi, esi, ebp, esp, ebx, edx, ecx, eax; 
    uint32_t intn, errc;
    uint32_t eip, cs, eflags, usresp, ss; 
} regs32;

typedef void func_t(void);
typedef void interrupt_fn_t(regs32);