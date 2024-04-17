# osdev 
# set magic number to 0x1BADB002 to identified by bootloader 
.set MAGIC,    0x1BADB002
.set MBOOT_PAGE_ALIGN, 1 << 0
.set MBOOT_MEM_INFO, 1 << 1
.set MBOOT_GRAPH_MODE, 1 << 2
.set FLAGS,   MBOOT_PAGE_ALIGN | MBOOT_MEM_INFO | MBOOT_GRAPH_MODE
# set the checksum
.set CHECKSUM, -(MAGIC + FLAGS)


# set multiboot enabled
.section .multiboot
.align 4
# define type to long for each data defined as above

.long MAGIC
.long FLAGS
.long CHECKSUM

.4byte 0
.4byte 0
.4byte 0
.4byte 0 
.4byte 0

.4byte 0
.4byte 640
.4byte 480
.4byte 16

# set the stack bottom 
.section .bss
.align 16
stack_bottom:
.skip 16384 # 16 KiB
stackTop:

.globl gdt_start, gdt_code
.globl isr_exception_type
.section .data
.align 8
drive: .byte 0 
isr_exception_type: .byte 0

gdt_start: 
    .4byte 0x0,0x0
gdt_code:
    .byte 0xFF,0xFF,0x0,0x0,0x0,0x9a,0xcf,0x0  # 0xFF,0xFF,0x0,0x0,0x0,0b10011010,0x9a,0xcf,0x0 #0b11001111,0x0
gdt_data:
    .byte 0xFF,0xFF,0x0,0x0,0x0,0x9f,0xcf,0x0 # 0xFF,0xFF,0x0,0x0,0x0,0b10010010,0x9f,0xcf,0x0 #0b11001111,0x0
gdt_user_code:
    .byte 0xFF,0xFF,0x0,0x0,0x0,0x9f,0xcf,0x0
gdt_user_data:
    .byte 0xFF,0xFF,0x0,0x0,0x0,0x9f,0xcf,0x0

// gdt_video:
//     .byte 0xFF,0xFF,0x0,0x80,0x0B,0b10010010,0b01000000,0x0
// NEED TO FILL UP GDT ENTRIES?
gdt_end:
gdt_descriptor:
    .word gdt_end - gdt_start - 1 # size (16 bit)
    .4byte gdt_start # a.4byteress (32 bit)
CODE_SEG = gdt_code - gdt_start
_CODE_SEG: .4byte gdt_code - gdt_start
DATA_SEG = gdt_data - gdt_start
//VIDEO_SEG = gdt_video - gdt_start

.globl gdt_code
.globl _CODE_SEG
.globl gdt_start

.section .text
.global _start
.type _start, @function


.extern exception_handler
.extern irq_handler
//.extern exception_handler_noerr
.extern kb_handler_isr

.macro isr_err_stub a
isr_stub_\a\():
    movb $\a\(), isr_exception_type
    cli
    jmp comm_excp
.endm

.macro isr_no_err_stub a
isr_stub_\a\():
    movb $\a\(), isr_exception_type
    cli
    jmp comm_excp
.endm

.macro irq a
isr_stub_\a\():
    movb $\a\(), isr_exception_type
    cli
    jmp irq_req
.endm

.macro int_no_pic a
isr_stub_\a\():
    movb $\a\(), isr_exception_type
    cli
    jmp irq_req
.endm

    // mov %dx, %ax
    // push %eax
    // mov $0x10, %ax
    // mov %ax, %ds
    // mov %ax, %es
    // mov %ax, %fs
    // mov %ax, %gs

     // pop %ebp
    // mov %ax, %ds
    // mov %ax, %es
    // mov %ax, %fs
    // mov %ax, %gs
    // popa
comm_excp:
    pushal
    call exception_handler
    popal
    #addl $8, %esp # clear interrupt data pushes to stack
    sti
    iret

irq_req:
    pushal
    call irq_handler
    popal
    sti
    #add $8, %esp
    iret

isr_no_err_stub 0
isr_no_err_stub 1
isr_no_err_stub 2
isr_no_err_stub 3
isr_no_err_stub 4
isr_no_err_stub 5
isr_no_err_stub 6
isr_no_err_stub 7
isr_err_stub    8
isr_no_err_stub 9
isr_err_stub    10
isr_err_stub    11
isr_err_stub    12
isr_err_stub    13
isr_err_stub    14
isr_no_err_stub 15
isr_no_err_stub 16
isr_err_stub    17
isr_no_err_stub 18
isr_no_err_stub 19
isr_no_err_stub 20
isr_no_err_stub 21
isr_no_err_stub 22
isr_no_err_stub 23
isr_no_err_stub 24
isr_no_err_stub 25
isr_no_err_stub 26
isr_no_err_stub 27
isr_no_err_stub 28
isr_no_err_stub 29
isr_err_stub    30
isr_no_err_stub 31
# user ones::
irq 32
irq 33
irq 34
irq 35
irq 36
irq 37
irq 38
irq 39
irq 40
irq 41
irq 42
irq 43
irq 44
irq 45
irq 46
irq 47
int_no_pic 48
int_no_pic 49
int_no_pic 50

//     call kb_handler_isr
//     iret

.globl isr_stub_table
isr_stub_table:
.4byte isr_stub_0
.4byte isr_stub_1
.4byte isr_stub_2
.4byte isr_stub_3
.4byte isr_stub_4
.4byte isr_stub_5
.4byte isr_stub_6
.4byte isr_stub_7
.4byte isr_stub_8
.4byte isr_stub_9
.4byte isr_stub_10
.4byte isr_stub_11
.4byte isr_stub_12
.4byte isr_stub_13
.4byte isr_stub_14
.4byte isr_stub_15
.4byte isr_stub_16
.4byte isr_stub_17
.4byte isr_stub_18
.4byte isr_stub_19
.4byte isr_stub_20
.4byte isr_stub_21
.4byte isr_stub_22
.4byte isr_stub_23
.4byte isr_stub_24
.4byte isr_stub_25
.4byte isr_stub_26
.4byte isr_stub_27
.4byte isr_stub_28
.4byte isr_stub_29
.4byte isr_stub_30
.4byte isr_stub_31
.4byte isr_stub_33
.4byte isr_stub_34
.4byte isr_stub_35
.4byte isr_stub_36
.4byte isr_stub_37
.4byte isr_stub_38
.4byte isr_stub_39
.4byte isr_stub_40
.4byte isr_stub_41
.4byte isr_stub_42
.4byte isr_stub_43
.4byte isr_stub_44
.4byte isr_stub_45
.4byte isr_stub_46
.4byte isr_stub_47
.4byte isr_stub_48
.4byte isr_stub_49
.4byte isr_stub_50

_start:

  # assign current stack pointer location to stackTop
	mov $stackTop, %esp

  # call the kernel main source
    lgdt gdt_descriptor
	call kernel_entry

# put system in infinite loop
hltLoop:
	jmp hltLoop

.size _start, . - _start
