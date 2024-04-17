ENTRY(_start)
SECTIONS {
    .rodata : {
        *(.rodata)
    }
    .bss : {
        *(.bss)
    }
    .data : {
        *(.data)
    }
    .text : {
        *(.text)
    }
}