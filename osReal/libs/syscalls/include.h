#pragma once

#include "../asm/include.h"
#include "../display/include.h"

#define SYSCALLS_IDT_ENTRY 49
#define SYSCALLS_IRQ_ENTRY SYSCALLS_IDT_ENTRY - 32

#define SYSCALL_PUTS 0
#define SYSCALL_PUTI 1
#define DATA_SEGMENT(x,r,type) ((type)(r.edx + x))
#include "sc_defaults.c"
#include "syscalls.c"