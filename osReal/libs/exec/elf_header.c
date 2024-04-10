// 

elf_section_offsets_t* elf_getHeaderInfo(char *file, uint32_t size)
{
    static elf_section_offsets_t return_struct;

    elf_header_t *header = (elf_header_t *)file;
    uint32_t SH_table = header->shoff;
    uint16_t SH_numEntries = header->shnum;    // number of SH entries
    uint16_t SH_entrySize = header->shentsize; // should be 40 (int size * 10 ints in SH struct)

    uint32_t PH_table = header->phoff;
    uint16_t PH_numEntries = header->phnum;    // number of PH entries
    uint16_t PH_entrySize = header->phentsize; // should be 32 (int size * 8 ints in PH struct)
    uint32_t used_PHaddr;
    uint32_t used_PHoffset;

    elf_sh_t *rodata_entry = 0;
    elf_sh_t *data_entry = 0;
    elf_sh_t *bss_entry = 0;
    elf_sh_t *text_entry = 0;

    // find data section in UNLINKED
    for (int i = 0; i < SH_numEntries; i++) // for each entry
    {
        // addr = file pointer + table offset + (index * size of struct)
    
        elf_sh_t *SH_entry = (elf_sh_t *)(file + SH_table + (i * SH_entrySize));
        elf_ph_t *PH_entry = (elf_ph_t *)(file + PH_table + (i * PH_entrySize));
        
        if (IS_RODATA(SH_entry)) // rules rodata section
        {
            if(rodata_entry == 0)
                rodata_entry = SH_entry;
        }
        else if (IS_DATA(SH_entry))
        {
            if(data_entry == 0)
                data_entry = SH_entry;
        }
        else if (IS_BSS(SH_entry))
        {
            if(bss_entry == 0)
                bss_entry = SH_entry;
        }
        else if (IS_TEXT(SH_entry))
        {
            if(text_entry == 0)
                text_entry = SH_entry;
        }

        if((i < PH_numEntries) && PH_entry->vaddr <= header->entry && header->entry < PH_entry->vaddr + PH_entry->memsz)
        {
            used_PHaddr = PH_entry->vaddr;
            used_PHoffset = PH_entry->offset;
        }
    }

    uint32_t first_data_offset; 
    uint32_t total_data_size; // total size of both data sectors
    
    if(rodata_entry == 0 || data_entry == 0)
    {
        if(rodata_entry == 0 && data_entry == 0) // both zero
        {
            total_data_size = 0;
            first_data_offset = 0;
        } else{
            // awful code. redo this
            total_data_size = rodata_entry == 0? data_entry->size : rodata_entry->size;
            first_data_offset = rodata_entry == 0? data_entry->offset : rodata_entry->offset;
        }
    }
    else if(rodata_entry->offset < data_entry->offset)
    {
        first_data_offset = rodata_entry->offset;  
        total_data_size = (data_entry->size + data_entry->offset) - rodata_entry->offset;
    } else {
        first_data_offset = data_entry->offset;
        total_data_size = (rodata_entry->size + rodata_entry->offset) - data_entry->offset;
    }

    return_struct = (elf_section_offsets_t) {
        .entry_fileOff = header->entry - used_PHaddr + used_PHoffset,
        .text_offset = text_entry->offset,
        .data_offset = first_data_offset,
        .text_size = text_entry->size,
        .data_size = total_data_size,
        .file = file,
        .file_size = size,
    };

    return &return_struct;
    //printf("===FIRST===\n -addr: %i\n -size: %i\n", first_data_offset, total_data_size);
    //printf("===ENTRY=== %p (offset from text section)\n", (void*) header->entry);
}