/*
data is being read from 0x0, it needs to be offset
use paging, segments, or something. No idea
Look into Virtual Memory Addressing


*/


void elf_exec(elf_section_offsets_t *header)
{
    tty_putString("ELF - global data: ");
    tty_putInt_nl((uint32_t)(&(header->file[header->data_offset])));
    asm volatile(
        "\npusha \n\
        mov %0, %%eax \n\
        mov %1, %%ebx \n\
        push %%ebx\n\
        call *%%eax \n\
        pop %%ebx\n\
        popa\n"
        :: "g"(&(header->file[header->entry_fileOff])), "g"(&(header->file[header->data_offset]))
        : "%eax", "%ebx");
}


// void elf_exec(elf_section_offsets_t *header)
// {
//     asm volatile(
//         "\npusha \n\
//         mov %0, %%edx \n\
//         mov %1, %%ebx \n\
//         mov %2, %%eax \n\
//         push %%ds \n\
//         push %%cs \n\
//         mov %%eax, %%ds \n\
//         mov %%ebx, %%eax \n\
//         mov %%eax, %%cs \n\
//         call *(%%eax, %%edx, 1) \n\
//         pop %%eax \n\
//         mov %%eax, %%cs \n\
//         pop %%eax \n\
//         mov %%eax, %% ds \n\
//         popa\n"
//         :: "g"(header->entry_noOff), "g"(header->text_offset + (uint32_t) header->file), "g"(header->data_offset + ((uint32_t) header->file))
//         : "%eax", "%ebx", "%ecx", "%edx");
//         //       %edx                  %ebx                   %eax
//     /*
//         all section are already allocated in file and file_size
//         needs to:
//         - push EBP
//         - push DS
//         - push CS
//         - move header->entry_noOff to register (ex. EDX)
//         - set CS to header->text_offset
//         - set DS to header->data_offset
//         - call address in CS + EDX (see above)
//         - (process will do stuff until returned)
//         - pop CS
//         - pop DS
//         - pop EBP
//     */
// }