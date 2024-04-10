
void elf_exec(elf_section_offsets_t *header)
{
    // mov %%dx, %%ds  causes GPE. no idea. anything that sets DS causes segfault.
    asm volatile(
        "\npusha \n\
        mov %0, %%eax \n\
        call *%%eax \n\
        popa\n"
        :: "g"(&(header->file[header->entry_fileOff]))
        : "%eax");
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