ENTRY(_start)
SECTIONS {
    . = 0x0;    /* Set the location counter to 0 */
    .data : {   /* Define the data section */
        *(.data)
    }
    .bss : {    /* Define the BSS section for uninitialized data */
        *(.bss)
    }
    .rodata : {
        *(.rodata)
    }
    .text : {   /* Define the text (code) section */
        *(.text)
    }
    /* Other sections as needed */
}