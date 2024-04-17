#pragma once

/*
from: https://wiki.osdev.org/Setting_Up_Paging
MMU - Memory Management Unit, for handling everything memory related
Page Directory - Array which the MMU uses to find the page tables
    - each entry is a pointer to a Page Table
Page Table - Array describing how the MMU should translate a certain range of addresses.
    - each entry contains the physical memory address to which a certain page should be mapped to
*/

// partly from osdev

// must be alligned
uint32_t page_directory[1024] __attribute__((aligned(4096)));

paging_clear_directory()
{
    for (uint32_t i = 0; i < 1024; i++)
    {
        // This sets the following flags to the pages:
        //   Supervisor: Only kernel-mode can access them
        //   Write Enabled: It can be both read from and written to
        //   Not Present: The page table is not present
        page_directory[i] = 0x00000002;
    }
}

uint32_t page_first_table[1024] __attribute__((aligned(4096)));

uint32_t* paging_create_table()
{

}