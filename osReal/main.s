	.file	"main.c"
	.text
	.globl	numLen
	.type	numLen, @function
numLen:
	pushl	%ebp
	movl	%esp, %ebp
	cmpl	$99999, 8(%ebp)
	jle	.L2
	cmpl	$9999999, 8(%ebp)
	jle	.L3
	cmpl	$999999999, 8(%ebp)
	jle	.L4
	movl	$10, %eax
	jmp	.L5
.L4:
	cmpl	$99999999, 8(%ebp)
	jle	.L6
	movl	$9, %eax
	jmp	.L5
.L6:
	movl	$8, %eax
	jmp	.L5
.L3:
	cmpl	$999999, 8(%ebp)
	jle	.L7
	movl	$7, %eax
	jmp	.L5
.L7:
	movl	$6, %eax
	jmp	.L5
.L2:
	cmpl	$999, 8(%ebp)
	jle	.L8
	cmpl	$9999, 8(%ebp)
	jle	.L9
	movl	$5, %eax
	jmp	.L5
.L9:
	movl	$4, %eax
	jmp	.L5
.L8:
	cmpl	$99, 8(%ebp)
	jle	.L10
	movl	$3, %eax
	jmp	.L5
.L10:
	cmpl	$9, 8(%ebp)
	jle	.L11
	movl	$2, %eax
	jmp	.L5
.L11:
	movl	$1, %eax
.L5:
	popl	%ebp
	ret
	.size	numLen, .-numLen
	.globl	gfx_current_ctx
	.section	.bss
	.align 4
	.type	gfx_current_ctx, @object
	.size	gfx_current_ctx, 16
gfx_current_ctx:
	.zero	16
	.globl	GFX_DEFAULT_WHITE
	.data
	.align 4
	.type	GFX_DEFAULT_WHITE, @object
	.size	GFX_DEFAULT_WHITE, 16
GFX_DEFAULT_WHITE:
	.long	65535
	.long	0
	.long	10
	.long	16
	.globl	GFX_DEFAULT_BLACK
	.align 4
	.type	GFX_DEFAULT_BLACK, @object
	.size	GFX_DEFAULT_BLACK, 16
GFX_DEFAULT_BLACK:
	.long	0
	.long	65535
	.long	10
	.long	16
	.globl	tty_current_ctx
	.section	.bss
	.align 32
	.type	tty_current_ctx, @object
	.size	tty_current_ctx, 40
tty_current_ctx:
	.zero	40
	.globl	VGA_BACKBUFFER
	.align 32
	.type	VGA_BACKBUFFER, @object
	.size	VGA_BACKBUFFER, 614400
VGA_BACKBUFFER:
	.zero	614400
	.globl	VGARAM
	.data
	.align 4
	.type	VGARAM, @object
	.size	VGARAM, 4
VGARAM:
	.long	-50331648
	.text
	.globl	inb
	.type	inb, @function
inb:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$20, %esp
	movl	8(%ebp), %eax
	movw	%ax, -20(%ebp)
	movl	-20(%ebp), %eax
	movl	%eax, %edx
/APP
/  4 "kernel/../libs/sys/../display/../ports/ports.c" 1
	inb %dx, %al
/  0 "" 2
/NO_APP
	movb	%al, -1(%ebp)
	movb	-1(%ebp), %al
	leave
	ret
	.size	inb, .-inb
	.globl	inw
	.type	inw, @function
inw:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$20, %esp
	movl	8(%ebp), %eax
	movw	%ax, -20(%ebp)
	movl	-20(%ebp), %eax
	movl	%eax, %edx
/APP
/  13 "kernel/../libs/sys/../display/../ports/ports.c" 1
	inw %dx, %ax
/  0 "" 2
/NO_APP
	movw	%ax, -2(%ebp)
	movw	-2(%ebp), %ax
	leave
	ret
	.size	inw, .-inw
	.globl	ioWait
	.type	ioWait, @function
ioWait:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$16, %esp
	movl	$0, -4(%ebp)
	jmp	.L17
.L18:
/APP
/  22 "kernel/../libs/sys/../display/../ports/ports.c" 1
	nop
/  0 "" 2
/NO_APP
	incl	-4(%ebp)
.L17:
	cmpl	$99, -4(%ebp)
	jle	.L18
	nop
	nop
	leave
	ret
	.size	ioWait, .-ioWait
	.globl	outb
	.type	outb, @function
outb:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$8, %esp
	movl	8(%ebp), %eax
	movl	12(%ebp), %edx
	movw	%ax, -4(%ebp)
	movb	%dl, %al
	movb	%al, -8(%ebp)
	movb	-8(%ebp), %al
	movl	-4(%ebp), %edx
/APP
/  27 "kernel/../libs/sys/../display/../ports/ports.c" 1
	outb %al, %dx
/  0 "" 2
/NO_APP
	nop
	leave
	ret
	.size	outb, .-outb
	.globl	outl
	.type	outl, @function
outl:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$4, %esp
	movl	8(%ebp), %eax
	movw	%ax, -4(%ebp)
	movl	12(%ebp), %eax
	movl	-4(%ebp), %edx
/APP
/  34 "kernel/../libs/sys/../display/../ports/ports.c" 1
	outl %eax, %dx
/  0 "" 2
/NO_APP
	nop
	leave
	ret
	.size	outl, .-outl
	.globl	outw
	.type	outw, @function
outw:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$4, %esp
	movl	8(%ebp), %eax
	movw	%ax, -4(%ebp)
	movl	12(%ebp), %eax
	movl	-4(%ebp), %edx
/APP
/  41 "kernel/../libs/sys/../display/../ports/ports.c" 1
	out %eax, %dx
/  0 "" 2
/NO_APP
	nop
	leave
	ret
	.size	outw, .-outw
	.globl	MOUSE_FONT_REG
	.data
	.align 4
	.type	MOUSE_FONT_REG, @object
	.size	MOUSE_FONT_REG, 16
MOUSE_FONT_REG:
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.ascii	"\200\300\340\360\370\374\030\f\006"
	.globl	MOUSE_FONT_SIZE
	.align 4
	.type	MOUSE_FONT_SIZE, @object
	.size	MOUSE_FONT_SIZE, 16
MOUSE_FONT_SIZE:
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.ascii	"\370\340\361\231\217\007\037"
	.globl	VGA_FONT
	.section	.rodata
	.align 4
.LC0:
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"<B\201\245\201\201\275\231\201B<"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"<~\377\333\377\377\303\347\377~<"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"l\376\376\376\376||8\020"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"\02088|\376|88\020"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"\02088T\376\376T\0208"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"\0208|\376\376\37688|"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"\030\030<<<<\030\030"
	.string	""
	.string	""
	.string	""
	.string	"\377\377\377\377\347\347\303\303\303\303\347\347\377\377\377\377"
	.string	""
	.string	"<<ffBBBBff<<"
	.string	""
	.string	"\377\377\303\303\231\231\275\275\275\275\231\231\303\303\377\377"
	.string	""
	.string	""
	.string	"\036\016\0322x\314\314\314\314x"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"<ffff<\030~\030\030"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"\030\034\036\033\030\030x\370p"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"\177cccccg\347\346\300"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"\030\030\333<\347<\333\030\030"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"\300\360\374\377\374\360\300"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"\003\017?\377?\017\003"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"\030<~\030\030\030\030\030\030\030\030\030\030~<\030ffffffffff"
	.string	""
	.string	"ff"
	.string	""
	.string	""
	.string	""
	.string	">zzzz:\032\032\032\032\032"
	.string	""
	.string	""
	.string	""
	.string	"<f`08lf6\034\f\006f<"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"~~~~~~"
	.string	""
	.string	"\030<~\030\030\030\030\030\030\030\030\030~<\030\377\030<~\030\030\030\030\030\030\030\030\030\030\030\030\030\030\030\030\030\030\030\030\030\030\030\030\030\030~<\030"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"\b\f\376\376\f\b"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"\0200\177\1770\020"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"\376\006\006\006\006"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"$f\377\377f$"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"\020\020\020\0208888||||\376\376\376\376\376\376\376\376||||8888\020\020\020\020"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"\030\030\030\030\030\030\030\030"
	.string	""
	.string	"\030\030"
	.string	""
	.string	""
	.string	""
	.string	"fff"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"lll\376lll\376lll"
	.string	""
	.string	""
	.string	""
	.string	"\030\030<f`0\030\f\006f<\030\030"
	.string	""
	.string	""
	.string	""
	.string	"\006\306\314\314\030\03000ff\306\300"
	.string	""
	.string	""
	.string	""
	.string	"8ll80z\336\314\314\314v"
	.string	""
	.string	""
	.string	""
	.string	"\030\030\0300"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"\f\030\0300000000\030\030\f"
	.string	""
	.string	""
	.string	"0\030\030\f\f\f\f\f\f\f\030\0300"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"ff<\377<ff"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"\030\030\030~\030\030\030"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"8\030\0300`"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"~"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"\030\030\030"
	.string	""
	.string	""
	.string	"\003\003\006\006\f\f\030\03000``\300\300"
	.string	""
	.string	""
	.string	""
	.string	"8l\306\306\316\326\346\306\306l8"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"\0308x\030\030\030\030\030\030\030~"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"<ff\006\006\f\0300``~"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"<ff\006\006\034\006\006ff<"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"\f\034<l\314\314\376\f\f\f\f"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"~```|\006\006\006ff<"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"\0340``|fffff<"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"~\006\006\006\f\f\030\030\030\030\030"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"<fffv<nfff<"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"<ffff>\006\006\006\f8"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"\030\030\030"
	.string	""
	.string	""
	.string	""
	.string	"\030\030\030"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"\030\030\030"
	.string	""
	.string	""
	.string	""
	.string	"8\030\0300`"
	.string	""
	.string	""
	.string	""
	.string	"\006\f\0300`0\030\f\006"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"~"
	.string	""
	.string	""
	.string	"~"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"`0\030\f\006\f\0300`"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"<ff\006\f\030\030\030"
	.string	""
	.string	"\030\030"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"|\306\306\306\336\336\336\334\300\300|"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"\030<fff~fffff"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"|ffflxlfff|"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"<ff`````ff<"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"xlffffffflx"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"~````|````~"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"~```|``````"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"<ff``nffff>"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"fffff~fffff"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"~\030\030\030\030\030\030\030\030\030~"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"\006\006\006\006\006\006\006\006ff<"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"\306\306\314\314\330\360\330\314\314\306\306"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"``````````~"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"\306\356\356\376\326\326\306\306\306\306\306"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"\306\306\346\346\366\376\336\316\316\306\306"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"<fffffffff<"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"|ffff|`````"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"<fffffffff<\f\006"
	.string	""
	.string	""
	.string	"|ffff|lffff"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"<ff`0\030\f\006ff<"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"~\030\030\030\030\030\030\030\030\030\030"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"ffffffffff<"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"fffffff<<\030\030"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"\306\306\306\306\306\326\326\376\356\356\306"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"\303\303f<\030\030\030<f\303\303"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"\303\303ff<\030\030\030\030\030\030"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"~\006\006\f\f\03000``~"
	.string	""
	.string	""
	.string	""
	.string	"<00000000000<"
	.string	""
	.string	"\300\300``00\030\030\f\f\006\006\003\003"
	.string	""
	.string	""
	.string	"<\f\f\f\f\f\f\f\f\f\f\f<"
	.string	""
	.string	""
	.string	"\0208ll\306\306"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"\377"
	.string	"\030\030\f\006"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"<\006>fff>"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"````|fffff|"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"<f```f<"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"\006\006\006\006>fffff>"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"<ff~``<"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"\036000~000000"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	">fffff>\006\006|"
	.string	""
	.string	"````|ffffff"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"\030\030"
	.string	""
	.string	"x\030\030\030\030\030\036"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"\f\f"
	.string	""
	.string	"\f\f\f\f\f\f\f\f\fx"
	.string	""
	.string	"````fflxlff"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"x\030\030\030\030\030\030\030\030\030\036"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"\314\376\326\326\326\326\306"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"|ffffff"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"<fffff<"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"|fffff|```"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	">fffff>\006\006\006"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"|ff````"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	">``<\006\006|"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"000~00000\036"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"ffffff>"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"fffff<\030"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"\306\306\326\326\326|l"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"\306\306l8l\306\306"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"ffffff>\006\006<"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"~\006\f\0300`~"
	.string	""
	.string	""
	.string	""
	.string	"\016\030\030\030\030\030\360\030\030\030\030\030\016"
	.string	""
	.string	"\030\030\030\030\030\030\030\030\030\030\030\030\030\030"
	.string	""
	.string	""
	.string	"\34000000\03600000\340"
	.string	""
	.string	""
	.string	"r\326\234"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"\0208l\306\306\306\376"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"`\374`|fffffff\006\006\034"
	.string	""
	.string	"\370`|ffffffff\006\006\034"
	.string	""
	.string	"\016\f\030"
	.string	"~``````"
	.string	""
	.string	""
	.string	"\f\030"
	.string	"~``````````"
	.string	""
	.string	""
	.string	""
	.string	"ff"
	.string	""
	.string	"<ff~``<"
	.string	""
	.string	""
	.string	"ff"
	.string	"~```|````~"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"<f`|`f<"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"<fff`|`fff<"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	">``<\006\006|"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"<ff`0\030\f\006ff<"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"\030\030"
	.string	""
	.string	"x\030\030\030\030\030\036"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"~\030\030\030\030\030\030\030\030\030~"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"ff"
	.string	""
	.string	"8\030\030\030\030\030<"
	.string	""
	.string	""
	.string	"ff"
	.string	"~\030\030\030\030\030\030\030\030~"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"\f\f"
	.string	""
	.string	"\f\f\f\f\f\f\f\f\fx"
	.string	""
	.string	"\006\006\006\006\006\006\006\006ff<"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"<llnmm\316"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"<llllnmmmm\316"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"\330\330\330\374\332\332\334"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"\330\330\330\330\330\330\374\332\332\332\334"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"`\374`|fffffff"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"\370`|ffffffff"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"\034\0300"
	.string	"\306\316\330\360\330\314\306"
	.string	""
	.string	""
	.string	"\0300"
	.string	"\306\316\330\330\330\360\330\314\314\314\306"
	.string	""
	.string	""
	.string	""
	.string	"ff<"
	.string	"ffffff<\f\030\360f<"
	.string	"fffffff<\f\030p"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"ffffff~\030\030"
	.string	""
	.string	""
	.string	"ffffffffff~\030\030"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"\314\326\326\366\326\326\314"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"\314\336\326\326\326\366\326\326\326\336\314"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"\340\340`|ff|"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"\360\360\26000<6666<"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"<\006>fff>"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"\030<fff~fffff"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"\006<`|fffff<"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"~````|ffff|"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"\314\314\314\314\314\314\376\006"
	.string	""
	.string	""
	.string	""
	.string	"\314\314\314\314\314\314\314\314\314\314\376\006\006"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"<lllll\376\306"
	.string	""
	.string	""
	.string	""
	.string	"\0366ffffffff\377\303\303"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"<ff~``<"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"~````|````~"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"\020\020|\326\326\326\326\326|\020\020"
	.string	""
	.string	"\020|\326\326\326\326\326\326\326\326\326|\020\020"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"~``````"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"~``````````"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"3f\314f3"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"\314f3f\314"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"\"\210\"\210\"\210\"\210\"\210\"\210\"\210\"\210\252U\252U\252U\252U\252U\252U\252U\252U\333w\333\356\333w\333\356\333w\333\356\333w\333\356\030\030\030\030\030\030\030\030\030\030\030\030\030\030\030\030\030\030\030\030\030\030\030\370\370\030\030\030\030\030\030\030"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"\306\306l8l\306\306"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"\303\303f<\030\030\030<f\303\303"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"\306\316\336\376\366\346\306"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"\306\306\316\316\336\376\366\346\346\306\306"
	.string	""
	.string	""
	.string	"llllll\354\f\354lllllllllllllllllllllll"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"\374\f\354lllllllllllll\354\f\374"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"\306|"
	.string	"\306\316\336\376\366\346\306"
	.string	""
	.string	""
	.string	"\306|"
	.string	"\306\306\316\316\336\366\346\346\306\306"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"\370\370\030\030\030\030\030\030\030\030\030\030\030\030\030\030\037\037"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"\030\030\030\030\030\030\030\377\377"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"\377\377\030\030\030\030\030\030\030\030\030\030\030\030\030\030\037\037\030\030\030\030\030\030\030"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"\377\377"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"\030\030\030\030\030\030\030\377\377\030\030\030\030\030\030\030"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"fflxlff"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"\306\306\314\314\330\360\330\314\314\306\306"
	.string	""
	.string	""
	.string	"llllllo`\177"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"\177`olllllllllllll\357"
	.string	"\377"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"\377"
	.string	"\357lllllllllllllo`olllllll"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"\377"
	.string	"\377"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"llllll\357"
	.string	"\357lllllll"
	.string	""
	.string	"f<fff<f"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	">fffff\346"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"\0366ffffffff\306"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"\306\356\376\376\326\326\306"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"\306\356\356\376\326\326\306\306\306\306\306"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"fff~fff"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"fffff~fffff"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"<fffff<"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"<fffffffff<"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"~ffffff"
	.string	""
	.string	""
	.string	"\030\030\030\030\030\030\030\370\370"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"\037\037\030\030\030\030\030\030\030\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"\377\377\377\377\377\377\377\377"
	.string	""
	.string	"~ffffffffff"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	">ff>\0366f"
	.string	""
	.string	""
	.string	"\377\377\377\377\377\377\377\377"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	">ffff>\0366fff"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"|fffff|```"
	.string	""
	.string	"|ffff|`````"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"<f```f<"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"<ff`````ff<"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"~\030\030\030\030\030\030"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"~\030\030\030\030\030\030\030\030\030\030"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"ffffff>\006\006<"
	.string	""
	.string	"\306\306\306\306\306\306\306~\006\006\374"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"\222\326|8|\326\222"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"\326\326\326\326|8|\326\326\326\326"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"|ff|ff|"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"|ffflxlfff|"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"```|ff|"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"`````|ffff|"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"\316\313\353\353\376\374\337\334\334\314\314"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"\376"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"\306\306\306\366\336\336\366"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"\306\306\306\306\306\366\336\336\336\336\366"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"<f\006\034\006f<"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"<ff\006\006\034\006\006ff<"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"\326\326\326\326\326\326\376"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"\326\326\326\326\326\326\326\326\326\326\376"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"x\314\006\036\006\314x"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"x\314\006\006\006>\006\006\006\314x"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"\326\326\326\326\326\326\376\006"
	.string	""
	.string	""
	.string	""
	.string	"\326\326\326\326\326\326\326\326\326\326\377\003\003"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"fff>\006\006\006"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"\306\306\306\306\306~\006\006\006\006\006"
	.string	""
	.string	""
	.string	""
	.string	"<f`08lf6\034\f\006f<"
	.string	""
	.string	""
	.string	""
	.string	"~~~~~~~~~~~~"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.data
	.align 4
	.type	VGA_FONT, @object
	.size	VGA_FONT, 4
VGA_FONT:
	.long	.LC0
	.text
	.globl	gfx_drawPixel_color
	.type	gfx_drawPixel_color, @function
gfx_drawPixel_color:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$20, %esp
	movl	8(%ebp), %eax
	movw	%ax, -20(%ebp)
	movl	16(%ebp), %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	sall	$7, %eax
	movl	%eax, %edx
	movl	12(%ebp), %eax
	addl	%edx, %eax
	movl	%eax, -4(%ebp)
	cmpl	$307200, -4(%ebp)
	ja	.L25
	movl	VGARAM, %edx
	movl	-4(%ebp), %eax
	addl	%eax, %eax
	addl	%eax, %edx
	movl	-20(%ebp), %eax
	movw	%ax, (%edx)
	jmp	.L22
.L25:
	nop
.L22:
	leave
	ret
	.size	gfx_drawPixel_color, .-gfx_drawPixel_color
	.type	gfx_drawInvertedPixel, @function
gfx_drawInvertedPixel:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$16, %esp
	movl	12(%ebp), %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	sall	$7, %eax
	movl	%eax, %edx
	movl	8(%ebp), %eax
	addl	%edx, %eax
	movl	%eax, -4(%ebp)
	movl	VGARAM, %edx
	movl	-4(%ebp), %eax
	addl	%eax, %eax
	addl	%edx, %eax
	movw	(%eax), %ax
	movl	VGARAM, %ecx
	movl	-4(%ebp), %edx
	addl	%edx, %edx
	addl	%ecx, %edx
	notl	%eax
	movw	%ax, (%edx)
	nop
	leave
	ret
	.size	gfx_drawInvertedPixel, .-gfx_drawInvertedPixel
	.globl	gfx_init_ctx
	.type	gfx_init_ctx, @function
gfx_init_ctx:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$16, %esp
	movl	12(%ebp), %eax
	sall	$11, %eax
	movl	%eax, %edx
	movl	16(%ebp), %eax
	sall	$5, %eax
	orl	%edx, %eax
	orl	20(%ebp), %eax
	movl	%eax, %edx
	movl	8(%ebp), %eax
	movl	%edx, (%eax)
	movl	8(%ebp), %eax
	movl	$0, 4(%eax)
	movl	8(%ebp), %eax
	movl	$10, 8(%eax)
	movl	8(%ebp), %eax
	movl	$16, 12(%eax)
	nop
	leave
	ret
	.size	gfx_init_ctx, .-gfx_init_ctx
	.globl	gfx_init_ctx_rtrn
	.type	gfx_init_ctx_rtrn, @function
gfx_init_ctx_rtrn:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$16, %esp
	movl	12(%ebp), %eax
	sall	$11, %eax
	movl	%eax, %edx
	movl	16(%ebp), %eax
	sall	$5, %eax
	orl	%edx, %eax
	orl	20(%ebp), %eax
	movl	%eax, %ecx
	movl	12(%ebp), %eax
	sall	$11, %eax
	movl	%eax, %edx
	movl	16(%ebp), %eax
	sall	$5, %eax
	orl	%edx, %eax
	orl	20(%ebp), %eax
	movl	%eax, %edx
	movl	8(%ebp), %eax
	movl	%ecx, (%eax)
	movl	8(%ebp), %eax
	movl	%edx, 4(%eax)
	movl	8(%ebp), %eax
	movl	$10, 8(%eax)
	movl	8(%ebp), %eax
	movl	$16, 12(%eax)
	movl	8(%ebp), %eax
	leave
	ret	$4
	.size	gfx_init_ctx_rtrn, .-gfx_init_ctx_rtrn
	.globl	gfx_init_ctx_rgb_rtrn
	.type	gfx_init_ctx_rgb_rtrn, @function
gfx_init_ctx_rgb_rtrn:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$16, %esp
	movl	12(%ebp), %ecx
	movl	12(%ebp), %edx
	movl	8(%ebp), %eax
	movl	%ecx, (%eax)
	movl	8(%ebp), %eax
	movl	%edx, 4(%eax)
	movl	8(%ebp), %eax
	movl	$10, 8(%eax)
	movl	8(%ebp), %eax
	movl	$16, 12(%eax)
	movl	8(%ebp), %eax
	leave
	ret	$4
	.size	gfx_init_ctx_rgb_rtrn, .-gfx_init_ctx_rgb_rtrn
	.local	px
	.comm	px,4,4
	.local	py
	.comm	py,4,4
	.globl	glyph
	.section	.bss
	.align 4
	.type	glyph, @object
	.size	glyph, 4
glyph:
	.zero	4
	.text
	.globl	gfx_drawGlyph_ctx
	.type	gfx_drawGlyph_ctx, @function
gfx_drawGlyph_ctx:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%esi
	pushl	%ebx
	addl	$16, 12(%ebp)
	movl	$0, py
	jmp	.L33
.L38:
	movl	$1, px
	jmp	.L34
.L37:
	movl	py, %edx
	movl	12(%ebp), %eax
	addl	%edx, %eax
	leal	-12(%eax), %ebx
	movl	px, %edx
	movl	8(%ebp), %eax
	addl	%eax, %edx
	movl	py, %eax
	movl	%eax, %ecx
	movl	16(%ebp), %eax
	addl	%ecx, %eax
	movb	(%eax), %al
	movzbl	%al, %esi
	movl	px, %ecx
	movl	$8, %eax
	subl	%ecx, %eax
	movb	%al, %cl
	sarl	%cl, %esi
	movl	%esi, %eax
	andl	$1, %eax
	testl	%eax, %eax
	je	.L35
	movl	20(%ebp), %eax
	movl	(%eax), %eax
	movzwl	%ax, %eax
	jmp	.L36
.L35:
	movl	20(%ebp), %eax
	movl	4(%eax), %eax
	movzwl	%ax, %eax
.L36:
	pushl	%ebx
	pushl	%edx
	pushl	%eax
	call	gfx_drawPixel_color
	addl	$12, %esp
	movl	px, %eax
	incl	%eax
	movl	%eax, px
.L34:
	movl	px, %eax
	cmpl	$8, %eax
	jle	.L37
	movl	py, %eax
	incl	%eax
	movl	%eax, py
.L33:
	movl	py, %eax
	cmpl	$15, %eax
	jle	.L38
	nop
	nop
	leal	-8(%ebp), %esp
	popl	%ebx
	popl	%esi
	popl	%ebp
	ret
	.size	gfx_drawGlyph_ctx, .-gfx_drawGlyph_ctx
	.globl	gfx_drawChar_ctx
	.type	gfx_drawChar_ctx, @function
gfx_drawChar_ctx:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$4, %esp
	movl	8(%ebp), %eax
	movb	%al, -4(%ebp)
	movsbl	-4(%ebp), %eax
	sall	$4, %eax
	movl	%eax, %edx
	movl	VGA_FONT, %eax
	addl	%edx, %eax
	movl	%eax, glyph
	movl	glyph, %eax
	pushl	20(%ebp)
	pushl	%eax
	pushl	16(%ebp)
	pushl	12(%ebp)
	call	gfx_drawGlyph_ctx
	addl	$16, %esp
	nop
	leave
	ret
	.size	gfx_drawChar_ctx, .-gfx_drawChar_ctx
	.type	gfx_drawChar, @function
gfx_drawChar:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$4, %esp
	movl	8(%ebp), %eax
	movb	%al, -4(%ebp)
	movsbl	-4(%ebp), %eax
	pushl	$gfx_current_ctx
	pushl	16(%ebp)
	pushl	12(%ebp)
	pushl	%eax
	call	gfx_drawChar_ctx
	addl	$16, %esp
	nop
	leave
	ret
	.size	gfx_drawChar, .-gfx_drawChar
	.globl	gfx_drawTransparentChar_color
	.type	gfx_drawTransparentChar_color, @function
gfx_drawTransparentChar_color:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$4, %esp
	movl	8(%ebp), %eax
	movb	%al, -4(%ebp)
	movsbl	-4(%ebp), %eax
	sall	$4, %eax
	movl	%eax, %edx
	movl	VGA_FONT, %eax
	addl	%edx, %eax
	movl	%eax, glyph
	addl	$16, 16(%ebp)
	movl	$0, py
	jmp	.L42
.L46:
	movl	$1, px
	jmp	.L43
.L45:
	movl	glyph, %eax
	movl	py, %edx
	addl	%edx, %eax
	movb	(%eax), %al
	movzbl	%al, %edx
	movl	px, %ecx
	movl	$8, %eax
	subl	%ecx, %eax
	movb	%al, %cl
	sarl	%cl, %edx
	movl	%edx, %eax
	andl	$1, %eax
	testl	%eax, %eax
	je	.L44
	movl	py, %edx
	movl	16(%ebp), %eax
	addl	%edx, %eax
	leal	-12(%eax), %ecx
	movl	px, %edx
	movl	12(%ebp), %eax
	addl	%eax, %edx
	movl	20(%ebp), %eax
	movzwl	%ax, %eax
	pushl	%ecx
	pushl	%edx
	pushl	%eax
	call	gfx_drawPixel_color
	addl	$12, %esp
.L44:
	movl	px, %eax
	incl	%eax
	movl	%eax, px
.L43:
	movl	px, %eax
	cmpl	$8, %eax
	jle	.L45
	movl	py, %eax
	incl	%eax
	movl	%eax, py
.L42:
	movl	py, %eax
	cmpl	$15, %eax
	jle	.L46
	nop
	nop
	leave
	ret
	.size	gfx_drawTransparentChar_color, .-gfx_drawTransparentChar_color
	.globl	gfx_drawInvertedTranparentGlyph
	.type	gfx_drawInvertedTranparentGlyph, @function
gfx_drawInvertedTranparentGlyph:
	pushl	%ebp
	movl	%esp, %ebp
	movl	$0, py
	jmp	.L48
.L52:
	movl	$1, px
	jmp	.L49
.L51:
	movl	py, %eax
	movl	%eax, %edx
	movl	8(%ebp), %eax
	addl	%edx, %eax
	movb	(%eax), %al
	movzbl	%al, %edx
	movl	px, %ecx
	movl	$8, %eax
	subl	%ecx, %eax
	movb	%al, %cl
	sarl	%cl, %edx
	movl	%edx, %eax
	andl	$1, %eax
	testl	%eax, %eax
	je	.L50
	movl	py, %edx
	movl	16(%ebp), %eax
	addl	%edx, %eax
	leal	-12(%eax), %edx
	movl	px, %ecx
	movl	12(%ebp), %eax
	addl	%ecx, %eax
	pushl	%edx
	pushl	%eax
	call	gfx_drawInvertedPixel
	addl	$8, %esp
.L50:
	movl	px, %eax
	incl	%eax
	movl	%eax, px
.L49:
	movl	px, %eax
	cmpl	$7, %eax
	jle	.L51
	movl	py, %eax
	incl	%eax
	movl	%eax, py
.L48:
	movl	py, %eax
	cmpl	$15, %eax
	jle	.L52
	nop
	nop
	leave
	ret
	.size	gfx_drawInvertedTranparentGlyph, .-gfx_drawInvertedTranparentGlyph
	.globl	gfx_drawString
	.type	gfx_drawString, @function
gfx_drawString:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$16, %esp
	movl	$0, -4(%ebp)
.L54:
	movl	-4(%ebp), %edx
	movl	8(%ebp), %eax
	addl	%edx, %eax
	movb	(%eax), %al
	movb	%al, -5(%ebp)
	movl	gfx_current_ctx+8, %eax
	imull	-4(%ebp), %eax
	movl	%eax, %edx
	movl	12(%ebp), %eax
	addl	%eax, %edx
	movsbl	-5(%ebp), %eax
	pushl	16(%ebp)
	pushl	%edx
	pushl	%eax
	call	gfx_drawChar
	addl	$12, %esp
	incl	-4(%ebp)
	movl	-4(%ebp), %edx
	movl	8(%ebp), %eax
	addl	%edx, %eax
	movb	(%eax), %al
	testb	%al, %al
	jne	.L54
	nop
	nop
	leave
	ret
	.size	gfx_drawString, .-gfx_drawString
	.globl	gfx_drawString_ctx
	.type	gfx_drawString_ctx, @function
gfx_drawString_ctx:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$16, %esp
	movl	$0, -4(%ebp)
.L56:
	movl	-4(%ebp), %edx
	movl	8(%ebp), %eax
	addl	%edx, %eax
	movb	(%eax), %al
	movb	%al, -5(%ebp)
	movl	gfx_current_ctx+8, %eax
	imull	-4(%ebp), %eax
	movl	%eax, %edx
	movl	12(%ebp), %eax
	addl	%eax, %edx
	movsbl	-5(%ebp), %eax
	pushl	20(%ebp)
	pushl	16(%ebp)
	pushl	%edx
	pushl	%eax
	call	gfx_drawChar_ctx
	addl	$16, %esp
	incl	-4(%ebp)
	movl	-4(%ebp), %edx
	movl	8(%ebp), %eax
	addl	%edx, %eax
	movb	(%eax), %al
	testb	%al, %al
	jne	.L56
	nop
	nop
	leave
	ret
	.size	gfx_drawString_ctx, .-gfx_drawString_ctx
	.globl	gfx_drawTransparentString_ctx
	.type	gfx_drawTransparentString_ctx, @function
gfx_drawTransparentString_ctx:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$16, %esp
	movl	$0, -4(%ebp)
.L58:
	movl	-4(%ebp), %edx
	movl	8(%ebp), %eax
	addl	%edx, %eax
	movb	(%eax), %al
	movb	%al, -5(%ebp)
	movl	20(%ebp), %eax
	movl	(%eax), %edx
	movl	gfx_current_ctx+8, %eax
	imull	-4(%ebp), %eax
	movl	%eax, %ecx
	movl	12(%ebp), %eax
	addl	%eax, %ecx
	movsbl	-5(%ebp), %eax
	pushl	%edx
	pushl	16(%ebp)
	pushl	%ecx
	pushl	%eax
	call	gfx_drawTransparentChar_color
	addl	$16, %esp
	incl	-4(%ebp)
	movl	-4(%ebp), %edx
	movl	8(%ebp), %eax
	addl	%edx, %eax
	movb	(%eax), %al
	testb	%al, %al
	jne	.L58
	nop
	nop
	leave
	ret
	.size	gfx_drawTransparentString_ctx, .-gfx_drawTransparentString_ctx
	.globl	gfx_drawInt
	.type	gfx_drawInt, @function
gfx_drawInt:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$16, %esp
	movl	gfx_current_ctx+8, %eax
	movl	%eax, -4(%ebp)
	cmpl	$0, 8(%ebp)
	jns	.L60
	negl	8(%ebp)
	pushl	16(%ebp)
	pushl	12(%ebp)
	pushl	$45
	call	gfx_drawChar
	addl	$12, %esp
	movl	-4(%ebp), %eax
	addl	%eax, 12(%ebp)
.L60:
	pushl	8(%ebp)
	call	numLen
	addl	$4, %esp
	decl	%eax
	movl	%eax, -8(%ebp)
	movl	-8(%ebp), %eax
	imull	-4(%ebp), %eax
	addl	%eax, 12(%ebp)
	cmpl	$0, 8(%ebp)
	jne	.L63
	pushl	16(%ebp)
	pushl	12(%ebp)
	pushl	$48
	call	gfx_drawChar
	addl	$12, %esp
	jmp	.L65
.L64:
	movl	8(%ebp), %eax
	movl	$10, %ecx
	cltd
	idivl	%ecx
	movl	%edx, %eax
	addl	$48, %eax
	movsbl	%al, %eax
	pushl	16(%ebp)
	pushl	12(%ebp)
	pushl	%eax
	call	gfx_drawChar
	addl	$12, %esp
	movl	8(%ebp), %ecx
	movl	$1717986919, %eax
	imull	%ecx
	movl	%edx, %eax
	sarl	$2, %eax
	movl	%ecx, %edx
	sarl	$31, %edx
	subl	%edx, %eax
	movl	%eax, 8(%ebp)
	movl	-4(%ebp), %eax
	subl	%eax, 12(%ebp)
.L63:
	cmpl	$0, 8(%ebp)
	jg	.L64
.L65:
	nop
	leave
	ret
	.size	gfx_drawInt, .-gfx_drawInt
	.globl	tty_init_ctx
	.type	tty_init_ctx, @function
tty_init_ctx:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$76, %esp
	movl	12(%ebp), %eax
	addl	$16, %eax
	movl	%eax, -80(%ebp)
	movl	20(%ebp), %eax
	movl	8(%eax), %eax
	imull	16(%ebp), %eax
	movl	%eax, -84(%ebp)
	movl	20(%ebp), %eax
	movl	12(%eax), %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	sall	$2, %eax
	movl	%eax, -88(%ebp)
	movl	20(%ebp), %edx
	leal	-28(%ebp), %eax
	movl	%edx, %ebx
	movl	$4, %edx
	movl	%eax, %edi
	movl	%ebx, %esi
	movl	%edx, %ecx
	rep movsl
	movl	24(%ebp), %eax
	movl	8(%ebp), %edx
	movl	%edx, (%eax)
	movl	24(%ebp), %eax
	movl	12(%ebp), %edx
	movl	%edx, 4(%eax)
	movl	24(%ebp), %eax
	movl	8(%ebp), %edx
	movl	%edx, 8(%eax)
	movl	24(%ebp), %eax
	movl	-80(%ebp), %ebx
	movl	%ebx, 12(%eax)
	movl	24(%ebp), %eax
	movl	-84(%ebp), %ecx
	movl	%ecx, 16(%eax)
	movl	24(%ebp), %eax
	movl	-88(%ebp), %esi
	movl	%esi, 20(%eax)
	movl	24(%ebp), %eax
	leal	24(%eax), %ebx
	leal	-28(%ebp), %eax
	movl	$4, %edx
	movl	%ebx, %edi
	movl	%eax, %esi
	movl	%edx, %ecx
	rep movsl
	nop
	addl	$76, %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	popl	%ebp
	ret
	.size	tty_init_ctx, .-tty_init_ctx
	.globl	tty_putChar_ctx
	.type	tty_putChar_ctx, @function
tty_putChar_ctx:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%ebx
	subl	$20, %esp
	movl	8(%ebp), %eax
	movb	%al, -24(%ebp)
	cmpb	$10, -24(%ebp)
	sete	%al
	movb	%al, -5(%ebp)
	cmpb	$0, -5(%ebp)
	jne	.L68
	movl	12(%ebp), %eax
	leal	24(%eax), %ebx
	movl	12(%ebp), %eax
	movl	12(%eax), %ecx
	movl	12(%ebp), %eax
	movl	8(%eax), %edx
	movsbl	-24(%ebp), %eax
	pushl	%ebx
	pushl	%ecx
	pushl	%edx
	pushl	%eax
	call	gfx_drawChar_ctx
	addl	$16, %esp
	movl	12(%ebp), %eax
	movl	8(%eax), %edx
	movl	12(%ebp), %eax
	movl	32(%eax), %eax
	addl	%eax, %edx
	movl	12(%ebp), %eax
	movl	%edx, 8(%eax)
.L68:
	cmpb	$0, -5(%ebp)
	jne	.L69
	movl	12(%ebp), %eax
	movl	8(%eax), %edx
	movl	12(%ebp), %eax
	movl	(%eax), %eax
	subl	%eax, %edx
	movl	12(%ebp), %eax
	movl	16(%eax), %eax
	cmpl	%eax, %edx
	jle	.L71
.L69:
	movl	12(%ebp), %eax
	movl	12(%eax), %edx
	movl	12(%ebp), %eax
	movl	36(%eax), %eax
	addl	%eax, %edx
	movl	12(%ebp), %eax
	movl	%edx, 12(%eax)
	movl	12(%ebp), %eax
	movl	(%eax), %edx
	movl	12(%ebp), %eax
	movl	%edx, 8(%eax)
.L71:
	nop
	movl	-4(%ebp), %ebx
	leave
	ret
	.size	tty_putChar_ctx, .-tty_putChar_ctx
	.type	tty_putChar, @function
tty_putChar:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$4, %esp
	movl	8(%ebp), %eax
	movb	%al, -4(%ebp)
	movsbl	-4(%ebp), %eax
	pushl	$tty_current_ctx
	pushl	%eax
	call	tty_putChar_ctx
	addl	$8, %esp
	nop
	leave
	ret
	.size	tty_putChar, .-tty_putChar
	.globl	tty_putString_ctx
	.type	tty_putString_ctx, @function
tty_putString_ctx:
	pushl	%ebp
	movl	%esp, %ebp
	jmp	.L74
.L75:
	movl	8(%ebp), %eax
	leal	1(%eax), %edx
	movl	%edx, 8(%ebp)
	movb	(%eax), %al
	movsbl	%al, %eax
	pushl	12(%ebp)
	pushl	%eax
	call	tty_putChar_ctx
	addl	$8, %esp
.L74:
	movl	8(%ebp), %eax
	movb	(%eax), %al
	testb	%al, %al
	jne	.L75
	nop
	nop
	leave
	ret
	.size	tty_putString_ctx, .-tty_putString_ctx
	.type	tty_putString, @function
tty_putString:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	$tty_current_ctx
	pushl	8(%ebp)
	call	tty_putString_ctx
	addl	$8, %esp
	nop
	leave
	ret
	.size	tty_putString, .-tty_putString
	.type	tty_putString_nl, @function
tty_putString_nl:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	$tty_current_ctx
	pushl	8(%ebp)
	call	tty_putString_ctx
	addl	$8, %esp
	pushl	$tty_current_ctx
	pushl	$10
	call	tty_putChar_ctx
	addl	$8, %esp
	nop
	leave
	ret
	.size	tty_putString_nl, .-tty_putString_nl
	.globl	tty_putInt_ctx
	.type	tty_putInt_ctx, @function
tty_putInt_ctx:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$16, %esp
	movl	12(%ebp), %eax
	movl	32(%eax), %eax
	movl	%eax, -4(%ebp)
	cmpl	$0, 8(%ebp)
	jns	.L79
	negl	8(%ebp)
	pushl	$45
	call	tty_putChar
	addl	$4, %esp
	jmp	.L80
.L79:
	cmpl	$0, 8(%ebp)
	jne	.L80
	pushl	$48
	call	tty_putChar
	addl	$4, %esp
	movl	12(%ebp), %eax
	movl	8(%eax), %edx
	movl	-4(%ebp), %eax
	addl	%eax, %edx
	movl	12(%ebp), %eax
	movl	%edx, 8(%eax)
	jmp	.L78
.L80:
	pushl	8(%ebp)
	call	numLen
	addl	$4, %esp
	decl	%eax
	movl	%eax, -8(%ebp)
	movl	12(%ebp), %eax
	movl	8(%eax), %edx
	movl	-8(%ebp), %eax
	imull	-4(%ebp), %eax
	addl	%eax, %edx
	movl	12(%ebp), %eax
	movl	%edx, 8(%eax)
	jmp	.L82
.L83:
	movl	8(%ebp), %ecx
	movl	$1717986919, %eax
	imull	%ecx
	sarl	$2, %edx
	movl	%ecx, %eax
	sarl	$31, %eax
	subl	%eax, %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	addl	%eax, %eax
	subl	%eax, %ecx
	movl	%ecx, %edx
	movb	%dl, %al
	addl	$48, %eax
	movsbl	%al, %eax
	pushl	%eax
	call	tty_putChar
	addl	$4, %esp
	movl	8(%ebp), %ecx
	movl	$1717986919, %eax
	imull	%ecx
	movl	%edx, %eax
	sarl	$2, %eax
	sarl	$31, %ecx
	movl	%ecx, %edx
	subl	%edx, %eax
	movl	%eax, 8(%ebp)
	movl	12(%ebp), %eax
	movl	8(%eax), %edx
	movl	-4(%ebp), %eax
	addl	%eax, %eax
	subl	%eax, %edx
	movl	12(%ebp), %eax
	movl	%edx, 8(%eax)
.L82:
	cmpl	$0, 8(%ebp)
	jg	.L83
	movl	12(%ebp), %eax
	movl	8(%eax), %edx
	movl	-8(%ebp), %eax
	addl	$2, %eax
	imull	-4(%ebp), %eax
	addl	%eax, %edx
	movl	12(%ebp), %eax
	movl	%edx, 8(%eax)
.L78:
	leave
	ret
	.size	tty_putInt_ctx, .-tty_putInt_ctx
	.type	tty_putInt, @function
tty_putInt:
	pushl	%ebp
	movl	%esp, %ebp
	movl	8(%ebp), %eax
	pushl	$tty_current_ctx
	pushl	%eax
	call	tty_putInt_ctx
	addl	$8, %esp
	nop
	leave
	ret
	.size	tty_putInt, .-tty_putInt
	.type	tty_putInt_nl, @function
tty_putInt_nl:
	pushl	%ebp
	movl	%esp, %ebp
	movl	8(%ebp), %eax
	pushl	$tty_current_ctx
	pushl	%eax
	call	tty_putInt_ctx
	addl	$8, %esp
	pushl	$tty_current_ctx
	pushl	$10
	call	tty_putChar_ctx
	addl	$8, %esp
	nop
	leave
	ret
	.size	tty_putInt_nl, .-tty_putInt_nl
	.globl	gfx_fillRect_col
	.type	gfx_fillRect_col, @function
gfx_fillRect_col:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$16, %esp
	movl	VGARAM, %ecx
	movl	12(%ebp), %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	sall	$7, %eax
	movl	%eax, %edx
	movl	8(%ebp), %eax
	addl	%edx, %eax
	addl	%eax, %eax
	addl	%ecx, %eax
	movl	%eax, -4(%ebp)
	movl	$0, -8(%ebp)
	jmp	.L87
.L90:
	movl	$0, -12(%ebp)
	jmp	.L88
.L89:
	movl	-12(%ebp), %eax
	addl	%eax, %eax
	movl	%eax, %edx
	movl	-4(%ebp), %eax
	addl	%eax, %edx
	movl	24(%ebp), %eax
	movw	%ax, (%edx)
	incl	-12(%ebp)
.L88:
	movl	-12(%ebp), %eax
	cmpl	16(%ebp), %eax
	jl	.L89
	addl	$1280, -4(%ebp)
	incl	-8(%ebp)
.L87:
	movl	-8(%ebp), %eax
	cmpl	20(%ebp), %eax
	jl	.L90
	nop
	nop
	leave
	ret
	.size	gfx_fillRect_col, .-gfx_fillRect_col
	.type	gfx_fillRect, @function
gfx_fillRect:
	pushl	%ebp
	movl	%esp, %ebp
	movl	24(%ebp), %eax
	movl	(%eax), %eax
	pushl	%eax
	pushl	20(%ebp)
	pushl	16(%ebp)
	pushl	12(%ebp)
	pushl	8(%ebp)
	call	gfx_fillRect_col
	addl	$20, %esp
	nop
	leave
	ret
	.size	gfx_fillRect, .-gfx_fillRect
	.type	gfx_clearRect, @function
gfx_clearRect:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	$0
	pushl	20(%ebp)
	pushl	16(%ebp)
	pushl	12(%ebp)
	pushl	8(%ebp)
	call	gfx_fillRect_col
	addl	$20, %esp
	nop
	leave
	ret
	.size	gfx_clearRect, .-gfx_clearRect
	.globl	gfx_fillBorderedRect_col
	.type	gfx_fillBorderedRect_col, @function
gfx_fillBorderedRect_col:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$16, %esp
	movl	VGARAM, %ecx
	movl	12(%ebp), %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	sall	$7, %eax
	movl	%eax, %edx
	movl	8(%ebp), %eax
	addl	%edx, %eax
	addl	%eax, %eax
	addl	%ecx, %eax
	movl	%eax, -4(%ebp)
	movl	$0, -12(%ebp)
	jmp	.L94
.L95:
	movl	-12(%ebp), %eax
	addl	%eax, %eax
	movl	%eax, %edx
	movl	-4(%ebp), %eax
	addl	%eax, %edx
	movl	28(%ebp), %eax
	movw	%ax, (%edx)
	incl	-12(%ebp)
.L94:
	movl	-12(%ebp), %eax
	cmpl	16(%ebp), %eax
	jl	.L95
	addl	$1280, -4(%ebp)
	movl	$1, -8(%ebp)
	jmp	.L96
.L99:
	movl	28(%ebp), %eax
	movl	-4(%ebp), %edx
	movw	%ax, (%edx)
	movl	$1, -12(%ebp)
	jmp	.L97
.L98:
	movl	-12(%ebp), %eax
	addl	%eax, %eax
	movl	%eax, %edx
	movl	-4(%ebp), %eax
	addl	%eax, %edx
	movl	24(%ebp), %eax
	movw	%ax, (%edx)
	incl	-12(%ebp)
.L97:
	movl	16(%ebp), %eax
	decl	%eax
	cmpl	%eax, -12(%ebp)
	jl	.L98
	movl	-12(%ebp), %eax
	addl	%eax, %eax
	movl	%eax, %edx
	movl	-4(%ebp), %eax
	addl	%eax, %edx
	movl	28(%ebp), %eax
	movw	%ax, (%edx)
	addl	$1280, -4(%ebp)
	incl	-8(%ebp)
.L96:
	movl	20(%ebp), %eax
	decl	%eax
	cmpl	%eax, -8(%ebp)
	jl	.L99
	movl	$0, -12(%ebp)
	jmp	.L100
.L101:
	movl	-12(%ebp), %eax
	addl	%eax, %eax
	movl	%eax, %edx
	movl	-4(%ebp), %eax
	addl	%eax, %edx
	movl	28(%ebp), %eax
	movw	%ax, (%edx)
	incl	-12(%ebp)
.L100:
	movl	-12(%ebp), %eax
	cmpl	16(%ebp), %eax
	jl	.L101
	nop
	nop
	leave
	ret
	.size	gfx_fillBorderedRect_col, .-gfx_fillBorderedRect_col
	.globl	gfx_getRect
	.type	gfx_getRect, @function
gfx_getRect:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$16, %esp
	movl	VGARAM, %ecx
	movl	12(%ebp), %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	sall	$7, %eax
	movl	%eax, %edx
	movl	8(%ebp), %eax
	addl	%edx, %eax
	addl	%eax, %eax
	addl	%ecx, %eax
	movl	%eax, -4(%ebp)
	movl	$0, -8(%ebp)
	jmp	.L103
.L106:
	movl	$0, -12(%ebp)
	jmp	.L104
.L105:
	movl	-12(%ebp), %eax
	addl	%eax, %eax
	movl	%eax, %edx
	movl	-4(%ebp), %eax
	leal	(%edx,%eax), %ecx
	movl	-12(%ebp), %eax
	addl	%eax, %eax
	movl	%eax, %edx
	movl	24(%ebp), %eax
	addl	%eax, %edx
	movw	(%ecx), %ax
	movw	%ax, (%edx)
	incl	-12(%ebp)
.L104:
	movl	-12(%ebp), %eax
	cmpl	16(%ebp), %eax
	jl	.L105
	movl	16(%ebp), %eax
	addl	%eax, %eax
	addl	%eax, 24(%ebp)
	addl	$1280, -4(%ebp)
	incl	-8(%ebp)
.L103:
	movl	-8(%ebp), %eax
	cmpl	20(%ebp), %eax
	jl	.L106
	nop
	nop
	leave
	ret
	.size	gfx_getRect, .-gfx_getRect
	.globl	gfx_drawBuffer
	.type	gfx_drawBuffer, @function
gfx_drawBuffer:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$16, %esp
	movl	VGARAM, %ecx
	movl	12(%ebp), %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	sall	$7, %eax
	movl	%eax, %edx
	movl	8(%ebp), %eax
	addl	%edx, %eax
	addl	%eax, %eax
	addl	%ecx, %eax
	movl	%eax, -4(%ebp)
	movl	$0, -8(%ebp)
	jmp	.L108
.L111:
	movl	$0, -12(%ebp)
	jmp	.L109
.L110:
	movl	-12(%ebp), %eax
	addl	%eax, %eax
	movl	%eax, %edx
	movl	24(%ebp), %eax
	leal	(%edx,%eax), %ecx
	movl	-12(%ebp), %eax
	addl	%eax, %eax
	movl	%eax, %edx
	movl	-4(%ebp), %eax
	addl	%eax, %edx
	movw	(%ecx), %ax
	movw	%ax, (%edx)
	incl	-12(%ebp)
.L109:
	movl	-12(%ebp), %eax
	cmpl	16(%ebp), %eax
	jl	.L110
	movl	16(%ebp), %eax
	addl	%eax, %eax
	addl	%eax, 24(%ebp)
	addl	$1280, -4(%ebp)
	incl	-8(%ebp)
.L108:
	movl	-8(%ebp), %eax
	cmpl	20(%ebp), %eax
	jl	.L111
	nop
	nop
	leave
	ret
	.size	gfx_drawBuffer, .-gfx_drawBuffer
	.globl	gfx_mouse_current_glpyh
	.data
	.align 4
	.type	gfx_mouse_current_glpyh, @object
	.size	gfx_mouse_current_glpyh, 4
gfx_mouse_current_glpyh:
	.long	MOUSE_FONT_REG
	.text
	.type	gfx_drawMouse, @function
gfx_drawMouse:
	pushl	%ebp
	movl	%esp, %ebp
	movl	gfx_mouse_current_glpyh, %eax
	pushl	12(%ebp)
	pushl	8(%ebp)
	pushl	%eax
	call	gfx_drawInvertedTranparentGlyph
	addl	$12, %esp
	nop
	leave
	ret
	.size	gfx_drawMouse, .-gfx_drawMouse
	.globl	gfx_db_begin
	.type	gfx_db_begin, @function
gfx_db_begin:
	pushl	%ebp
	movl	%esp, %ebp
	movl	$VGA_BACKBUFFER, VGARAM
	nop
	popl	%ebp
	ret
	.size	gfx_db_begin, .-gfx_db_begin
	.globl	gfx_db_end
	.type	gfx_db_end, @function
gfx_db_end:
	pushl	%ebp
	movl	%esp, %ebp
	movl	$-50331648, VGARAM
	nop
	popl	%ebp
	ret
	.size	gfx_db_end, .-gfx_db_end
	.globl	gfx_db_swap
	.type	gfx_db_swap, @function
gfx_db_swap:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$16, %esp
	movl	$0, -4(%ebp)
	jmp	.L116
.L117:
	movl	-4(%ebp), %eax
	addl	%eax, %eax
	leal	-50331648(%eax), %edx
	movl	-4(%ebp), %eax
	movw	VGA_BACKBUFFER(%eax,%eax), %ax
	movw	%ax, (%edx)
	incl	-4(%ebp)
.L116:
	cmpl	$307199, -4(%ebp)
	jle	.L117
	nop
	nop
	leave
	ret
	.size	gfx_db_swap, .-gfx_db_swap
	.globl	malloc_memory
	.section	.bss
	.align 32
	.type	malloc_memory, @object
	.size	malloc_memory, 10000
malloc_memory:
	.zero	10000
	.globl	ptr
	.data
	.align 4
	.type	ptr, @object
	.size	ptr, 4
ptr:
	.long	malloc_memory
	.text
	.globl	malloc
	.type	malloc, @function
malloc:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$4, %esp
	movl	8(%ebp), %eax
	movw	%ax, -4(%ebp)
	movl	ptr, %eax
	movzwl	-4(%ebp), %edx
	incl	%edx
	addl	%edx, %eax
	movl	%eax, ptr
	movl	ptr, %eax
	movzwl	-4(%ebp), %edx
	notl	%edx
	addl	%edx, %eax
	leave
	ret
	.size	malloc, .-malloc
	.globl	free
	.type	free, @function
free:
	pushl	%ebp
	movl	%esp, %ebp
	nop
	popl	%ebp
	ret
	.size	free, .-free
	.globl	linked_length
	.type	linked_length, @function
linked_length:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$16, %esp
	cmpl	$0, 8(%ebp)
	jne	.L122
	movl	$0, %eax
	jmp	.L123
.L122:
	movl	$1, -4(%ebp)
.L125:
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	testl	%eax, %eax
	jne	.L124
	movl	-4(%ebp), %eax
	jmp	.L123
.L124:
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	movl	%eax, 8(%ebp)
	incl	-4(%ebp)
	jmp	.L125
.L123:
	leave
	ret
	.size	linked_length, .-linked_length
	.globl	linked_read_link
	.type	linked_read_link, @function
linked_read_link:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$16, %esp
	movl	$0, -4(%ebp)
	cmpl	$-1, 12(%ebp)
	je	.L127
	movl	12(%ebp), %eax
	jmp	.L128
.L127:
	movl	$2147483647, %eax
.L128:
	movl	%eax, -8(%ebp)
	jmp	.L129
.L134:
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	testl	%eax, %eax
	jne	.L130
	cmpl	$-1, 12(%ebp)
	jne	.L131
	movl	8(%ebp), %eax
	jmp	.L133
.L131:
	movl	$0, %eax
	jmp	.L133
.L130:
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	movl	%eax, 8(%ebp)
	incl	-4(%ebp)
.L129:
	movl	-4(%ebp), %eax
	cmpl	-8(%ebp), %eax
	jl	.L134
	movl	8(%ebp), %eax
.L133:
	leave
	ret
	.size	linked_read_link, .-linked_read_link
	.globl	linked_add
	.type	linked_add, @function
linked_add:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%ebx
	subl	$16, %esp
	pushl	$8
	call	malloc
	addl	$4, %esp
	movl	%eax, -12(%ebp)
	movl	-12(%ebp), %eax
	movl	12(%ebp), %edx
	movl	%edx, (%eax)
	movl	-12(%ebp), %eax
	movl	$0, 4(%eax)
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	testl	%eax, %eax
	jne	.L136
	movl	8(%ebp), %eax
	movl	-12(%ebp), %edx
	movl	%edx, (%eax)
	jmp	.L137
.L136:
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, -8(%ebp)
	jmp	.L138
.L139:
	movl	-8(%ebp), %eax
	movl	4(%eax), %eax
	movl	%eax, -8(%ebp)
.L138:
	movl	-8(%ebp), %eax
	movl	4(%eax), %eax
	testl	%eax, %eax
	jne	.L139
	movl	-8(%ebp), %eax
	movl	-12(%ebp), %edx
	movl	%edx, 4(%eax)
.L137:
	movl	-12(%ebp), %eax
	movl	-4(%ebp), %ebx
	leave
	ret
	.size	linked_add, .-linked_add
	.type	remove_noFree, @function
remove_noFree:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$32, %esp
	cmpl	$0, 12(%ebp)
	jne	.L142
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, -24(%ebp)
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	movl	4(%eax), %edx
	movl	8(%ebp), %eax
	movl	%edx, (%eax)
	movl	-24(%ebp), %eax
	jmp	.L143
.L142:
	cmpl	$-1, 12(%ebp)
	jne	.L144
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	pushl	%eax
	call	linked_length
	addl	$4, %esp
	leal	-1(%eax), %edx
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	pushl	%edx
	pushl	%eax
	call	linked_read_link
	addl	$8, %esp
	movl	%eax, -16(%ebp)
	movl	-16(%ebp), %eax
	movl	%eax, -20(%ebp)
	movl	-16(%ebp), %eax
	movl	$0, 4(%eax)
	movl	-20(%ebp), %eax
	jmp	.L143
.L144:
	movl	12(%ebp), %eax
	leal	-1(%eax), %edx
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	pushl	%edx
	pushl	%eax
	call	linked_read_link
	addl	$8, %esp
	movl	%eax, -4(%ebp)
	movl	-4(%ebp), %eax
	movl	4(%eax), %eax
	movl	4(%eax), %eax
	movl	%eax, -8(%ebp)
	movl	-4(%ebp), %eax
	movl	4(%eax), %eax
	movl	%eax, -12(%ebp)
	movl	-4(%ebp), %eax
	movl	-8(%ebp), %edx
	movl	%edx, 4(%eax)
	movl	-12(%ebp), %eax
.L143:
	leave
	ret
	.size	remove_noFree, .-remove_noFree
	.globl	linked_remove
	.type	linked_remove, @function
linked_remove:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	12(%ebp)
	pushl	8(%ebp)
	call	remove_noFree
	addl	$8, %esp
	pushl	%eax
	call	free
	addl	$4, %esp
	nop
	leave
	ret
	.size	linked_remove, .-linked_remove
	.globl	linked_moveToEnd
	.type	linked_moveToEnd, @function
linked_moveToEnd:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$16, %esp
	pushl	12(%ebp)
	pushl	8(%ebp)
	call	remove_noFree
	addl	$8, %esp
	movl	%eax, -4(%ebp)
	movl	-4(%ebp), %eax
	movl	(%eax), %eax
	pushl	%eax
	pushl	8(%ebp)
	call	linked_add
	addl	$8, %esp
	nop
	leave
	ret
	.size	linked_moveToEnd, .-linked_moveToEnd
	.globl	itoa
	.type	itoa, @function
itoa:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$16, %esp
	cmpl	$0, 8(%ebp)
	jns	.L148
	negl	8(%ebp)
	movl	12(%ebp), %eax
	leal	1(%eax), %edx
	movl	%edx, 12(%ebp)
	movb	$45, (%eax)
.L148:
	pushl	8(%ebp)
	call	numLen
	addl	$4, %esp
	decl	%eax
	movl	%eax, -4(%ebp)
	movl	-4(%ebp), %eax
	incl	%eax
	addl	%eax, 12(%ebp)
	movl	12(%ebp), %eax
	leal	-1(%eax), %edx
	movl	%edx, 12(%ebp)
	movb	$0, (%eax)
	cmpl	$0, 8(%ebp)
	jne	.L151
	movl	12(%ebp), %eax
	movb	$48, (%eax)
	jmp	.L153
.L152:
	movl	8(%ebp), %ecx
	movl	$1717986919, %eax
	imull	%ecx
	sarl	$2, %edx
	movl	%ecx, %eax
	sarl	$31, %eax
	subl	%eax, %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	addl	%eax, %eax
	subl	%eax, %ecx
	movl	%ecx, %edx
	movb	%dl, %al
	addl	$48, %eax
	movb	%al, %dl
	movl	12(%ebp), %eax
	movb	%dl, (%eax)
	movl	8(%ebp), %ecx
	movl	$1717986919, %eax
	imull	%ecx
	movl	%edx, %eax
	sarl	$2, %eax
	sarl	$31, %ecx
	movl	%ecx, %edx
	subl	%edx, %eax
	movl	%eax, 8(%ebp)
	decl	12(%ebp)
.L151:
	cmpl	$0, 8(%ebp)
	jg	.L152
.L153:
	nop
	leave
	ret
	.size	itoa, .-itoa
	.globl	memcpy
	.type	memcpy, @function
memcpy:
	pushl	%ebp
	movl	%esp, %ebp
	jmp	.L155
.L156:
	movl	12(%ebp), %eax
	movb	(%eax), %dl
	movl	8(%ebp), %eax
	movb	%dl, (%eax)
	incl	8(%ebp)
	incl	12(%ebp)
	decl	16(%ebp)
.L155:
	cmpl	$0, 16(%ebp)
	jne	.L156
	nop
	nop
	popl	%ebp
	ret
	.size	memcpy, .-memcpy
	.globl	strcut
	.type	strcut, @function
strcut:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$20, %esp
	movl	12(%ebp), %eax
	movb	%al, -20(%ebp)
	movl	$0, -4(%ebp)
	jmp	.L158
.L159:
	incl	-4(%ebp)
	incl	8(%ebp)
.L158:
	movl	8(%ebp), %eax
	movb	(%eax), %al
	cmpb	%al, -20(%ebp)
	jne	.L159
	movl	8(%ebp), %eax
	movb	$0, (%eax)
	movl	-4(%ebp), %eax
	leave
	ret
	.size	strcut, .-strcut
	.globl	strlen
	.type	strlen, @function
strlen:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$16, %esp
	movl	$0, -4(%ebp)
	jmp	.L162
.L163:
	incl	-4(%ebp)
	incl	8(%ebp)
.L162:
	movl	8(%ebp), %eax
	movb	(%eax), %al
	testb	%al, %al
	jne	.L163
	movl	-4(%ebp), %eax
	leave
	ret
	.size	strlen, .-strlen
	.globl	strcmp
	.type	strcmp, @function
strcmp:
	pushl	%ebp
	movl	%esp, %ebp
	jmp	.L166
.L169:
	movl	8(%ebp), %eax
	movb	(%eax), %al
	testb	%al, %al
	jne	.L167
	movl	$0, %eax
	jmp	.L168
.L167:
	incl	8(%ebp)
	incl	12(%ebp)
.L166:
	movl	8(%ebp), %eax
	movb	(%eax), %dl
	movl	12(%ebp), %eax
	movb	(%eax), %al
	cmpb	%al, %dl
	je	.L169
	movl	8(%ebp), %eax
	movb	(%eax), %al
	movsbl	%al, %edx
	movl	12(%ebp), %eax
	movb	(%eax), %al
	movsbl	%al, %eax
	subl	%eax, %edx
	movl	%edx, %eax
.L168:
	popl	%ebp
	ret
	.size	strcmp, .-strcmp
	.globl	strcat
	.type	strcat, @function
strcat:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%ebx
	pushl	12(%ebp)
	call	strlen
	addl	$4, %esp
	leal	1(%eax), %ebx
	pushl	8(%ebp)
	call	strlen
	addl	$4, %esp
	movl	8(%ebp), %edx
	addl	%edx, %eax
	pushl	%ebx
	pushl	12(%ebp)
	pushl	%eax
	call	memcpy
	addl	$12, %esp
	nop
	movl	-4(%ebp), %ebx
	leave
	ret
	.size	strcat, .-strcat
	.globl	strcatch
	.type	strcatch, @function
strcatch:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$20, %esp
	movl	12(%ebp), %eax
	movb	%al, -20(%ebp)
	pushl	8(%ebp)
	call	strlen
	addl	$4, %esp
	movl	8(%ebp), %edx
	addl	%edx, %eax
	movl	%eax, -4(%ebp)
	movl	-4(%ebp), %eax
	movb	-20(%ebp), %dl
	movb	%dl, (%eax)
	movl	-4(%ebp), %eax
	incl	%eax
	movb	$0, (%eax)
	nop
	leave
	ret
	.size	strcatch, .-strcatch
	.globl	linked_dict_add
	.type	linked_dict_add, @function
linked_dict_add:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$16, %esp
	pushl	$8
	call	malloc
	addl	$4, %esp
	movl	%eax, -4(%ebp)
	movl	-4(%ebp), %eax
	movl	12(%ebp), %edx
	movl	%edx, 4(%eax)
	movl	-4(%ebp), %eax
	movl	16(%ebp), %edx
	movl	%edx, (%eax)
	pushl	-4(%ebp)
	pushl	8(%ebp)
	call	linked_add
	addl	$8, %esp
	nop
	leave
	ret
	.size	linked_dict_add, .-linked_dict_add
	.globl	linked_dict_read_link
	.type	linked_dict_read_link, @function
linked_dict_read_link:
	pushl	%ebp
	movl	%esp, %ebp
.L177:
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	testl	%eax, %eax
	jne	.L174
	movl	$0, %eax
	jmp	.L175
.L174:
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	movl	(%eax), %eax
	pushl	12(%ebp)
	pushl	%eax
	call	strcmp
	addl	$8, %esp
	testl	%eax, %eax
	jne	.L176
	movl	8(%ebp), %eax
	jmp	.L175
.L176:
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	movl	%eax, 8(%ebp)
	jmp	.L177
.L175:
	leave
	ret
	.size	linked_dict_read_link, .-linked_dict_read_link
	.local	idt
	.comm	idt,2048,16
	.globl	idt_customs
	.section	.bss
	.align 32
	.type	idt_customs, @object
	.size	idt_customs, 200
idt_customs:
	.zero	200
	.text
	.globl	pic_acknowledge
	.type	pic_acknowledge, @function
pic_acknowledge:
	pushl	%ebp
	movl	%esp, %ebp
	cmpl	$31, 8(%ebp)
	jbe	.L183
	cmpl	$47, 8(%ebp)
	ja	.L183
	cmpl	$39, 8(%ebp)
	ja	.L182
	pushl	$32
	pushl	$32
	call	outb
	addl	$8, %esp
	jmp	.L178
.L182:
	pushl	$32
	pushl	$160
	call	outb
	addl	$8, %esp
	jmp	.L178
.L183:
	nop
.L178:
	leave
	ret
	.size	pic_acknowledge, .-pic_acknowledge
	.globl	PIC_sendEOI
	.type	PIC_sendEOI, @function
PIC_sendEOI:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$4, %esp
	movl	8(%ebp), %eax
	movb	%al, -4(%ebp)
	cmpb	$7, -4(%ebp)
	jbe	.L185
	pushl	$32
	pushl	$160
	call	outb
	addl	$8, %esp
.L185:
	pushl	$32
	pushl	$32
	call	outb
	addl	$8, %esp
	nop
	leave
	ret
	.size	PIC_sendEOI, .-PIC_sendEOI
	.globl	pic_disable_irq
	.type	pic_disable_irq, @function
pic_disable_irq:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$20, %esp
	movl	8(%ebp), %eax
	movb	%al, -20(%ebp)
	cmpb	$7, -20(%ebp)
	ja	.L187
	pushl	$33
	call	inb
	addl	$4, %esp
	movb	%al, -1(%ebp)
	jmp	.L188
.L187:
	pushl	$161
	call	inb
	addl	$4, %esp
	movb	%al, -1(%ebp)
.L188:
	movzbl	-20(%ebp), %eax
	andl	$7, %eax
	movl	$1, %edx
	movb	%al, %cl
	sall	%cl, %edx
	movl	%edx, %eax
	movb	%al, -2(%ebp)
	movb	-2(%ebp), %al
	orb	%al, -1(%ebp)
	cmpb	$7, -20(%ebp)
	ja	.L189
	movzbl	-1(%ebp), %eax
	pushl	%eax
	pushl	$33
	call	outb
	addl	$8, %esp
	jmp	.L191
.L189:
	movzbl	-1(%ebp), %eax
	pushl	%eax
	pushl	$161
	call	outb
	addl	$8, %esp
.L191:
	nop
	leave
	ret
	.size	pic_disable_irq, .-pic_disable_irq
	.globl	pic_enable_irq
	.type	pic_enable_irq, @function
pic_enable_irq:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$20, %esp
	movl	8(%ebp), %eax
	movb	%al, -20(%ebp)
	cmpb	$7, -20(%ebp)
	ja	.L193
	pushl	$33
	call	inb
	addl	$4, %esp
	movb	%al, -1(%ebp)
	jmp	.L194
.L193:
	pushl	$161
	call	inb
	addl	$4, %esp
	movb	%al, -1(%ebp)
.L194:
	movzbl	-20(%ebp), %eax
	andl	$7, %eax
	movl	$1, %edx
	movb	%al, %cl
	sall	%cl, %edx
	movl	%edx, %eax
	notl	%eax
	movb	%al, -2(%ebp)
	movb	-2(%ebp), %al
	andb	%al, -1(%ebp)
	cmpb	$7, -20(%ebp)
	ja	.L195
	movzbl	-1(%ebp), %eax
	pushl	%eax
	pushl	$33
	call	outb
	addl	$8, %esp
	jmp	.L197
.L195:
	movzbl	-1(%ebp), %eax
	pushl	%eax
	pushl	$161
	call	outb
	addl	$8, %esp
.L197:
	nop
	leave
	ret
	.size	pic_enable_irq, .-pic_enable_irq
	.globl	pic_remap
	.type	pic_remap, @function
pic_remap:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	$17
	pushl	$32
	call	outb
	addl	$8, %esp
	pushl	$17
	pushl	$160
	call	outb
	addl	$8, %esp
	pushl	$32
	pushl	$33
	call	outb
	addl	$8, %esp
	pushl	$40
	pushl	$161
	call	outb
	addl	$8, %esp
	pushl	$4
	pushl	$33
	call	outb
	addl	$8, %esp
	pushl	$2
	pushl	$161
	call	outb
	addl	$8, %esp
	pushl	$1
	pushl	$33
	call	outb
	addl	$8, %esp
	pushl	$1
	pushl	$161
	call	outb
	addl	$8, %esp
	pushl	$255
	pushl	$33
	call	outb
	addl	$8, %esp
	pushl	$255
	pushl	$161
	call	outb
	addl	$8, %esp
	nop
	leave
	ret
	.size	pic_remap, .-pic_remap
	.section	.rodata
.LC1:
	.string	"CRITICAL FAULT"
	.text
	.globl	exception_handler
	.type	exception_handler, @function
exception_handler:
	pushl	%ebp
	movl	%esp, %ebp
	call	gfx_db_end
	pushl	$31
	pushl	$480
	pushl	$640
	pushl	$0
	pushl	$0
	call	gfx_fillRect_col
	addl	$20, %esp
	pushl	$20
	pushl	$20
	pushl	$.LC1
	call	gfx_drawString
	addl	$12, %esp
	movb	isr_exception_type, %al
	movsbl	%al, %eax
	pushl	$20
	pushl	$30
	pushl	%eax
	call	gfx_drawInt
	addl	$12, %esp
/APP
/  8 "kernel/../libs/interrupts/idt.c" 1
	cli; jmp .;
/  0 "" 2
/NO_APP
	nop
	leave
	ret
	.size	exception_handler, .-exception_handler
	.globl	irq_handler
	.type	irq_handler, @function
irq_handler:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$44, %esp
	movb	isr_exception_type, %al
	movsbl	%al, %eax
	subl	$33, %eax
	movl	%eax, -28(%ebp)
	movl	-28(%ebp), %eax
	movl	idt_customs(,%eax,4), %eax
	testl	%eax, %eax
	je	.L201
	movl	-28(%ebp), %eax
	movl	idt_customs(,%eax,4), %eax
	movl	%eax, -44(%ebp)
	subl	$4, %esp
	subl	$60, %esp
	movl	%esp, %eax
	movl	%eax, %edx
	leal	8(%ebp), %ebx
	movl	$15, %eax
	movl	%edx, %edi
	movl	%ebx, %esi
	movl	%eax, %ecx
	rep movsl
	movl	-44(%ebp), %eax
	call	*%eax
	addl	$64, %esp
.L201:
	movl	-28(%ebp), %eax
	movzbl	%al, %eax
	subl	$12, %esp
	pushl	%eax
	call	PIC_sendEOI
	addl	$16, %esp
	nop
	leal	-12(%ebp), %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	popl	%ebp
	ret
	.size	irq_handler, .-irq_handler
	.globl	idt_load_interrupt
	.type	idt_load_interrupt, @function
idt_load_interrupt:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$4, %esp
	movl	8(%ebp), %eax
	movb	%al, -4(%ebp)
	movzbl	-4(%ebp), %eax
	movl	12(%ebp), %edx
	movl	%edx, idt_customs(,%eax,4)
	nop
	leave
	ret
	.size	idt_load_interrupt, .-idt_load_interrupt
	.globl	idt_set_gate
	.type	idt_set_gate, @function
idt_set_gate:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$24, %esp
	movl	8(%ebp), %edx
	movl	16(%ebp), %eax
	movb	%dl, -20(%ebp)
	movb	%al, -24(%ebp)
	movzbl	-20(%ebp), %eax
	sall	$3, %eax
	addl	$idt, %eax
	movl	%eax, -4(%ebp)
	movl	12(%ebp), %eax
	movl	-4(%ebp), %edx
	movw	%ax, (%edx)
	movl	_CODE_SEG, %eax
	movl	-4(%ebp), %edx
	movw	%ax, 2(%edx)
	movl	-4(%ebp), %eax
	movb	$0, 4(%eax)
	movl	-4(%ebp), %eax
	movb	-24(%ebp), %dl
	movb	%dl, 5(%eax)
	movl	12(%ebp), %eax
	shrl	$16, %eax
	movl	-4(%ebp), %edx
	movw	%ax, 6(%edx)
	nop
	leave
	ret
	.size	idt_set_gate, .-idt_set_gate
	.local	idtr
	.comm	idtr,6,4
	.globl	idt_load_stubs
	.type	idt_load_stubs, @function
idt_load_stubs:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$16, %esp
	movl	$idt, %eax
	movl	%eax, idtr+2
	movw	$2047, idtr
	movb	$0, -1(%ebp)
	jmp	.L205
.L206:
	movzbl	-1(%ebp), %eax
	movl	isr_stub_table(,%eax,4), %edx
	movzbl	-1(%ebp), %eax
	pushl	$142
	pushl	%edx
	pushl	%eax
	call	idt_set_gate
	addl	$12, %esp
	movzbl	-1(%ebp), %eax
	movl	$0, idt_customs(,%eax,4)
	movb	-1(%ebp), %al
	incl	%eax
	movb	%al, -1(%ebp)
.L205:
	cmpb	$31, -1(%ebp)
	jbe	.L206
	movb	$32, -1(%ebp)
	jmp	.L207
.L208:
	movzbl	-1(%ebp), %eax
	movl	isr_stub_table(,%eax,4), %edx
	movzbl	-1(%ebp), %eax
	pushl	$142
	pushl	%edx
	pushl	%eax
	call	idt_set_gate
	addl	$12, %esp
	movb	-1(%ebp), %al
	incl	%eax
	movb	%al, -1(%ebp)
.L207:
	cmpb	$49, -1(%ebp)
	jbe	.L208
/APP
/  55 "kernel/../libs/interrupts/idt.c" 1
	lidt idtr
/  0 "" 2
/NO_APP
	nop
	leave
	ret
	.size	idt_load_stubs, .-idt_load_stubs
	.globl	enable_interrupts
	.type	enable_interrupts, @function
enable_interrupts:
	pushl	%ebp
	movl	%esp, %ebp
/APP
/  60 "kernel/../libs/interrupts/idt.c" 1
	sti;
/  0 "" 2
/NO_APP
	nop
	popl	%ebp
	ret
	.size	enable_interrupts, .-enable_interrupts
	.globl	disable_interrupts
	.type	disable_interrupts, @function
disable_interrupts:
	pushl	%ebp
	movl	%esp, %ebp
/APP
/  65 "kernel/../libs/interrupts/idt.c" 1
	cli;
/  0 "" 2
/NO_APP
	nop
	popl	%ebp
	ret
	.size	disable_interrupts, .-disable_interrupts
	.globl	tick
	.section	.bss
	.align 4
	.type	tick, @object
	.size	tick, 4
tick:
	.zero	4
	.text
	.type	timer_callback, @function
timer_callback:
	pushl	%ebp
	movl	%esp, %ebp
	movl	tick, %eax
	incl	%eax
	movl	%eax, tick
	movl	tick, %eax
	leal	1(%eax), %edx
	movl	%edx, tick
	pushl	$325
	pushl	$325
	pushl	%eax
	call	gfx_drawInt
	addl	$12, %esp
	nop
	leave
	ret
	.size	timer_callback, .-timer_callback
	.globl	timer_init
	.type	timer_init, @function
timer_init:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$16, %esp
	movl	$1193180, %eax
	movl	$0, %edx
	divl	8(%ebp)
	movl	%eax, -4(%ebp)
	pushl	$54
	pushl	$67
	call	outb
	addl	$8, %esp
	movl	-4(%ebp), %eax
	movb	%al, -5(%ebp)
	movl	-4(%ebp), %eax
	shrl	$8, %eax
	movb	%al, -6(%ebp)
	movzbl	-5(%ebp), %eax
	pushl	%eax
	pushl	$64
	call	outb
	addl	$8, %esp
	movzbl	-6(%ebp), %eax
	pushl	%eax
	pushl	$64
	call	outb
	addl	$8, %esp
	nop
	leave
	ret
	.size	timer_init, .-timer_init
	.globl	KEYSET
	.section	.rodata
	.align 32
	.type	KEYSET, @object
	.size	KEYSET, 128
KEYSET:
	.string	"`^1234567890-=\b\tqwertyuiop[]\\ asdfghjkl;'\n  zxcvbnm,./      ~!@#$%^&*()_+  QWERTYUIOP{}| ASDFGHJKL:\"   ZXCVBNM<>?"
	.zero	14
	.local	keyboard_sc
	.comm	keyboard_sc,1,1
	.text
	.globl	keyboard_handler
	.type	keyboard_handler, @function
keyboard_handler:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	$96
	call	inb
	addl	$4, %esp
	movb	%al, keyboard_sc
	nop
	leave
	ret
	.size	keyboard_handler, .-keyboard_handler
	.globl	getKeyCode
	.type	getKeyCode, @function
getKeyCode:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$16, %esp
	nop
.L215:
	movb	keyboard_sc, %al
	testb	%al, %al
	js	.L215
	movb	keyboard_sc, %al
	movb	%al, -1(%ebp)
	nop
.L216:
	movb	keyboard_sc, %al
	movzbl	%al, %edx
	movsbl	-1(%ebp), %eax
	cmpl	%eax, %edx
	je	.L216
	movb	-1(%ebp), %al
	leave
	ret
	.size	getKeyCode, .-getKeyCode
	.globl	getch
	.type	getch, @function
getch:
	pushl	%ebp
	movl	%esp, %ebp
	call	getKeyCode
	movsbl	%al, %eax
	movb	KEYSET(%eax), %al
	popl	%ebp
	ret
	.size	getch, .-getch
	.globl	gets
	.type	gets, @function
gets:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$16, %esp
	movb	$0, -1(%ebp)
	jmp	.L221
.L223:
	cmpb	$14, -1(%ebp)
	jne	.L222
	decl	8(%ebp)
	movl	8(%ebp), %eax
	movb	$0, (%eax)
	jmp	.L221
.L222:
	incl	8(%ebp)
.L221:
	call	getKeyCode
	movb	%al, -1(%ebp)
	cmpb	$28, -1(%ebp)
	jne	.L223
	movl	8(%ebp), %eax
	movb	$0, (%eax)
	movl	$0, %eax
	leave
	ret
	.size	gets, .-gets
	.local	mouse_cycle
	.comm	mouse_cycle,1,1
	.local	mouse_byte
	.comm	mouse_byte,3,1
	.local	mouse_x
	.comm	mouse_x,4,4
	.local	mouse_y
	.comm	mouse_y,4,4
	.globl	mouse_down
	.section	.bss
	.type	mouse_down, @object
	.size	mouse_down, 1
mouse_down:
	.zero	1
	.local	saveBuffer
	.comm	saveBuffer,256,32
	.local	mouse_edgeType
	.comm	mouse_edgeType,1,1
	.local	mouse_clickFn
	.comm	mouse_clickFn,4,4
	.local	mouse_moveFn
	.comm	mouse_moveFn,4,4
	.text
	.globl	mouse_onClick
	.type	mouse_onClick, @function
mouse_onClick:
	pushl	%ebp
	movl	%esp, %ebp
	movl	8(%ebp), %eax
	movl	%eax, mouse_clickFn
	nop
	popl	%ebp
	ret
	.size	mouse_onClick, .-mouse_onClick
	.globl	mouse_onMove
	.type	mouse_onMove, @function
mouse_onMove:
	pushl	%ebp
	movl	%esp, %ebp
	movl	8(%ebp), %eax
	movl	%eax, mouse_moveFn
	nop
	popl	%ebp
	ret
	.size	mouse_onMove, .-mouse_onMove
	.type	mouse_handleClick, @function
mouse_handleClick:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%ebx
	subl	$20, %esp
	movl	8(%ebp), %eax
	movb	%al, -12(%ebp)
	movb	-12(%ebp), %al
	andl	$7, %eax
	movb	%al, mouse_down
	movl	mouse_clickFn, %eax
	testl	%eax, %eax
	je	.L231
	movb	mouse_edgeType, %al
	testb	%al, %al
	jne	.L229
	movb	mouse_down, %al
	testb	%al, %al
	jne	.L230
.L229:
	movb	mouse_edgeType, %al
	cmpb	$1, %al
	jne	.L231
	movb	mouse_down, %al
	testb	%al, %al
	jne	.L231
.L230:
	movb	mouse_down, %al
	testb	%al, %al
	setne	%al
	movb	%al, mouse_edgeType
	movl	mouse_clickFn, %eax
	movb	mouse_edgeType, %dl
	movsbl	%dl, %ebx
	movl	mouse_y, %ecx
	movl	mouse_x, %edx
	subl	$4, %esp
	pushl	%ebx
	pushl	%ecx
	pushl	%edx
	call	*%eax
	addl	$16, %esp
.L231:
	nop
	movl	-4(%ebp), %ebx
	leave
	ret
	.size	mouse_handleClick, .-mouse_handleClick
	.type	mouse_render, @function
mouse_render:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$24, %esp
	movl	8(%ebp), %edx
	movl	12(%ebp), %eax
	movb	%dl, -20(%ebp)
	movb	%al, -24(%ebp)
	movl	mouse_y, %eax
	cmpl	$11, %eax
	jg	.L233
	movl	$12, mouse_y
.L233:
	movl	mouse_x, %eax
	testl	%eax, %eax
	jns	.L234
	movl	$0, mouse_x
.L234:
	movl	VGARAM, %eax
	cmpl	$VGA_BACKBUFFER, %eax
	sete	%al
	movzbl	%al, %eax
	movl	%eax, -4(%ebp)
	call	gfx_db_end
	movl	mouse_y, %eax
	leal	-12(%eax), %edx
	movl	mouse_x, %eax
	pushl	$saveBuffer
	pushl	$16
	pushl	$8
	pushl	%edx
	pushl	%eax
	call	gfx_drawBuffer
	addl	$20, %esp
	movsbl	-20(%ebp), %edx
	movl	mouse_x, %eax
	addl	%edx, %eax
	movl	%eax, mouse_x
	movl	mouse_y, %eax
	movsbl	-24(%ebp), %edx
	subl	%edx, %eax
	movl	%eax, mouse_y
	movl	mouse_y, %eax
	leal	-12(%eax), %edx
	movl	mouse_x, %eax
	pushl	$saveBuffer
	pushl	$16
	pushl	$8
	pushl	%edx
	pushl	%eax
	call	gfx_getRect
	addl	$20, %esp
	movl	mouse_y, %edx
	movl	mouse_x, %eax
	pushl	%edx
	pushl	%eax
	call	gfx_drawMouse
	addl	$8, %esp
	cmpl	$0, -4(%ebp)
	je	.L236
	call	gfx_db_begin
.L236:
	nop
	leave
	ret
	.size	mouse_render, .-mouse_render
	.type	mouse_handleMove, @function
mouse_handleMove:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$24, %esp
	movl	8(%ebp), %edx
	movl	12(%ebp), %eax
	movb	%dl, -12(%ebp)
	movb	%al, -16(%ebp)
	movsbl	-16(%ebp), %edx
	movsbl	-12(%ebp), %eax
	pushl	%edx
	pushl	%eax
	call	mouse_render
	addl	$8, %esp
	movl	mouse_moveFn, %eax
	testl	%eax, %eax
	je	.L239
	movl	mouse_moveFn, %eax
	movl	mouse_y, %ecx
	movl	mouse_x, %edx
	subl	$8, %esp
	pushl	%ecx
	pushl	%edx
	call	*%eax
	addl	$16, %esp
.L239:
	nop
	leave
	ret
	.size	mouse_handleMove, .-mouse_handleMove
	.globl	mouse_handler
	.type	mouse_handler, @function
mouse_handler:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$8, %esp
	movb	mouse_cycle, %al
	movsbl	%al, %eax
	cmpl	$2, %eax
	je	.L241
	cmpl	$2, %eax
	jg	.L245
	testl	%eax, %eax
	je	.L243
	cmpl	$1, %eax
	je	.L244
	jmp	.L245
.L243:
	pushl	$96
	call	inb
	addl	$4, %esp
	movb	%al, mouse_byte
	movb	mouse_byte, %al
	movzbl	%al, %eax
	subl	$12, %esp
	pushl	%eax
	call	mouse_handleClick
	addl	$16, %esp
	movb	mouse_cycle, %al
	incl	%eax
	movb	%al, mouse_cycle
	jmp	.L242
.L244:
	subl	$12, %esp
	pushl	$96
	call	inb
	addl	$16, %esp
	movb	%al, mouse_byte+1
	movb	mouse_cycle, %al
	incl	%eax
	movb	%al, mouse_cycle
	jmp	.L242
.L241:
	subl	$12, %esp
	pushl	$96
	call	inb
	addl	$16, %esp
	movb	%al, mouse_byte+2
	movb	mouse_byte+2, %al
	movsbl	%al, %edx
	movb	mouse_byte+1, %al
	movsbl	%al, %eax
	subl	$8, %esp
	pushl	%edx
	pushl	%eax
	call	mouse_handleMove
	addl	$16, %esp
	movb	$0, mouse_cycle
	nop
.L242:
.L245:
	nop
	leave
	ret
	.size	mouse_handler, .-mouse_handler
	.globl	mouse_wait
	.type	mouse_wait, @function
mouse_wait:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$20, %esp
	movl	8(%ebp), %eax
	movb	%al, -20(%ebp)
	movl	$1000000, -4(%ebp)
	cmpb	$0, -20(%ebp)
	jne	.L251
	jmp	.L248
.L250:
	pushl	$100
	call	inb
	addl	$4, %esp
	movzbl	%al, %eax
	andl	$1, %eax
	cmpl	$1, %eax
	je	.L253
.L248:
	movl	-4(%ebp), %eax
	leal	-1(%eax), %edx
	movl	%edx, -4(%ebp)
	testl	%eax, %eax
	jne	.L250
	jmp	.L246
.L252:
	pushl	$100
	call	inb
	addl	$4, %esp
	movzbl	%al, %eax
	andl	$2, %eax
	testl	%eax, %eax
	je	.L254
.L251:
	movl	-4(%ebp), %eax
	leal	-1(%eax), %edx
	movl	%edx, -4(%ebp)
	testl	%eax, %eax
	jne	.L252
	jmp	.L246
.L253:
	nop
	jmp	.L246
.L254:
	nop
.L246:
	leave
	ret
	.size	mouse_wait, .-mouse_wait
	.globl	mouse_read
	.type	mouse_read, @function
mouse_read:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	$0
	call	mouse_wait
	addl	$4, %esp
	pushl	$96
	call	inb
	addl	$4, %esp
	leave
	ret
	.size	mouse_read, .-mouse_read
	.globl	mouse_write
	.type	mouse_write, @function
mouse_write:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$4, %esp
	movl	8(%ebp), %eax
	movb	%al, -4(%ebp)
	pushl	$1
	call	mouse_wait
	addl	$4, %esp
	pushl	$212
	pushl	$100
	call	outb
	addl	$8, %esp
	pushl	$1
	call	mouse_wait
	addl	$4, %esp
	movzbl	-4(%ebp), %eax
	pushl	%eax
	pushl	$96
	call	outb
	addl	$8, %esp
	nop
	leave
	ret
	.size	mouse_write, .-mouse_write
	.globl	mouse_detect
	.type	mouse_detect, @function
mouse_detect:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$16, %esp
	call	mouse_read
	movb	%al, -1(%ebp)
	cmpb	$-6, -1(%ebp)
	je	.L259
	movl	$0, %eax
	jmp	.L260
.L259:
	movl	$1, %eax
.L260:
	leave
	ret
	.size	mouse_detect, .-mouse_detect
	.globl	mouse_init
	.type	mouse_init, @function
mouse_init:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$16, %esp
	pushl	$212
	pushl	$100
	call	outb
	addl	$8, %esp
	pushl	$244
	pushl	$96
	call	outb
	addl	$8, %esp
	nop
.L262:
	pushl	$96
	call	inb
	addl	$4, %esp
	cmpb	$-6, %al
	jne	.L262
	pushl	$32
	pushl	$100
	call	outb
	addl	$8, %esp
	pushl	$96
	call	inb
	addl	$4, %esp
	movb	%al, -1(%ebp)
	orb	$2, -1(%ebp)
	pushl	$96
	pushl	$100
	call	outb
	addl	$8, %esp
	movzbl	-1(%ebp), %eax
	pushl	%eax
	pushl	$96
	call	outb
	addl	$8, %esp
	pushl	$saveBuffer
	pushl	$16
	pushl	$8
	pushl	$0
	pushl	$0
	call	gfx_getRect
	addl	$20, %esp
	nop
	leave
	ret
	.size	mouse_init, .-mouse_init
	.globl	elf_exec
	.type	elf_exec, @function
elf_exec:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$4, %esp
	movl	8(%ebp), %eax
	movl	(%eax), %esi
	movl	8(%ebp), %eax
	movl	4(%eax), %edx
	movl	8(%ebp), %eax
	movl	20(%eax), %eax
	leal	(%edx,%eax), %edi
	movl	8(%ebp), %eax
	movl	12(%eax), %edx
	movl	8(%ebp), %eax
	movl	20(%eax), %eax
	addl	%edx, %eax
	movl	%eax, -16(%ebp)
/APP
/  4 "kernel/../libs/exec/elf_exec.c" 1
	
pusha      
        mov %esi, %edx 
        mov %edi, %ebx 
        mov -16(%ebp), %eax 
        push %ds     
        push %cs     
        pop %ax     
        mov %ax, %cs 
        pop %ax 
        mov %ax, % ds 
        popa

/  0 "" 2
/NO_APP
	nop
	addl	$4, %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	popl	%ebp
	ret
	.size	elf_exec, .-elf_exec
	.globl	elf_getHeaderInfo
	.type	elf_getHeaderInfo, @function
elf_getHeaderInfo:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$80, %esp
	movl	8(%ebp), %eax
	movl	%eax, -32(%ebp)
	movl	-32(%ebp), %eax
	movl	32(%eax), %eax
	movl	%eax, -36(%ebp)
	movl	-32(%ebp), %eax
	movl	48(%eax), %eax
	movw	%ax, -38(%ebp)
	movl	-32(%ebp), %eax
	movw	46(%eax), %ax
	movw	%ax, -40(%ebp)
	movl	$0, -4(%ebp)
	movl	$0, -8(%ebp)
	movl	$0, -12(%ebp)
	movl	$0, -16(%ebp)
	movl	$0, -20(%ebp)
	jmp	.L265
.L273:
	movzwl	-40(%ebp), %eax
	imull	-20(%ebp), %eax
	movl	%eax, %edx
	movl	-36(%ebp), %eax
	addl	%eax, %edx
	movl	8(%ebp), %eax
	addl	%edx, %eax
	movl	%eax, -44(%ebp)
	movl	-44(%ebp), %eax
	movl	20(%eax), %eax
	testl	%eax, %eax
	je	.L266
	movl	-44(%ebp), %eax
	movl	4(%eax), %eax
	cmpl	$1, %eax
	jne	.L266
	movl	-44(%ebp), %eax
	movl	8(%eax), %eax
	cmpl	$2, %eax
	jne	.L266
	cmpl	$0, -4(%ebp)
	jne	.L268
	movl	-44(%ebp), %eax
	movl	%eax, -4(%ebp)
	jmp	.L268
.L266:
	movl	-44(%ebp), %eax
	movl	20(%eax), %eax
	testl	%eax, %eax
	je	.L269
	movl	-44(%ebp), %eax
	movl	4(%eax), %eax
	cmpl	$1, %eax
	jne	.L269
	movl	-44(%ebp), %eax
	movl	8(%eax), %eax
	cmpl	$3, %eax
	jne	.L269
	cmpl	$0, -8(%ebp)
	jne	.L268
	movl	-44(%ebp), %eax
	movl	%eax, -8(%ebp)
	jmp	.L268
.L269:
	movl	-44(%ebp), %eax
	movl	20(%eax), %eax
	testl	%eax, %eax
	je	.L271
	movl	-44(%ebp), %eax
	movl	4(%eax), %eax
	cmpl	$8, %eax
	jne	.L271
	movl	-44(%ebp), %eax
	movl	8(%eax), %eax
	cmpl	$3, %eax
	jne	.L271
	cmpl	$0, -12(%ebp)
	jne	.L268
	movl	-44(%ebp), %eax
	movl	%eax, -12(%ebp)
	jmp	.L268
.L271:
	movl	-44(%ebp), %eax
	movl	20(%eax), %eax
	testl	%eax, %eax
	je	.L268
	movl	-44(%ebp), %eax
	movl	4(%eax), %eax
	cmpl	$1, %eax
	jne	.L268
	movl	-44(%ebp), %eax
	movl	8(%eax), %eax
	cmpl	$6, %eax
	jne	.L268
	cmpl	$0, -16(%ebp)
	jne	.L268
	movl	-44(%ebp), %eax
	movl	%eax, -16(%ebp)
.L268:
	incl	-20(%ebp)
.L265:
	movzwl	-38(%ebp), %eax
	cmpl	%eax, -20(%ebp)
	jl	.L273
	movl	-4(%ebp), %eax
	movl	16(%eax), %edx
	movl	-8(%ebp), %eax
	movl	16(%eax), %eax
	cmpl	%eax, %edx
	jnb	.L274
	movl	-4(%ebp), %eax
	movl	16(%eax), %eax
	movl	%eax, -24(%ebp)
	movl	-8(%ebp), %eax
	movl	20(%eax), %edx
	movl	-8(%ebp), %eax
	movl	16(%eax), %eax
	leal	(%edx,%eax), %ecx
	movl	-4(%ebp), %eax
	movl	16(%eax), %edx
	movl	%ecx, %eax
	subl	%edx, %eax
	movl	%eax, -28(%ebp)
	jmp	.L275
.L274:
	movl	-8(%ebp), %eax
	movl	16(%eax), %eax
	movl	%eax, -24(%ebp)
	movl	-4(%ebp), %eax
	movl	20(%eax), %edx
	movl	-4(%ebp), %eax
	movl	16(%eax), %eax
	leal	(%edx,%eax), %ecx
	movl	-8(%ebp), %eax
	movl	16(%eax), %edx
	movl	%ecx, %eax
	subl	%edx, %eax
	movl	%eax, -28(%ebp)
.L275:
	movl	-32(%ebp), %eax
	movl	24(%eax), %ecx
	movl	-16(%ebp), %eax
	movl	16(%eax), %edx
	movl	-16(%ebp), %eax
	movl	20(%eax), %eax
	movl	%ecx, return_struct.4
	movl	%edx, return_struct.4+4
	movl	%eax, return_struct.4+8
	movl	-24(%ebp), %eax
	movl	%eax, return_struct.4+12
	movl	-28(%ebp), %eax
	movl	%eax, return_struct.4+16
	movl	8(%ebp), %eax
	movl	%eax, return_struct.4+20
	movl	12(%ebp), %eax
	movl	%eax, return_struct.4+24
	movl	$return_struct.4, %eax
	leave
	ret
	.size	elf_getHeaderInfo, .-elf_getHeaderInfo
	.globl	sector_count
	.data
	.type	sector_count, @object
	.size	sector_count, 1
sector_count:
	.byte	1
	.globl	ata_idenfity_buffer
	.section	.bss
	.align 32
	.type	ata_idenfity_buffer, @object
	.size	ata_idenfity_buffer, 512
ata_idenfity_buffer:
	.zero	512
	.text
	.globl	print_bin
	.type	print_bin, @function
print_bin:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$20, %esp
	movl	8(%ebp), %eax
	movb	%al, -20(%ebp)
	movl	$0, -4(%ebp)
	jmp	.L278
.L279:
	movsbl	-20(%ebp), %edx
	movl	-4(%ebp), %eax
	movb	%al, %cl
	sall	%cl, %edx
	movl	%edx, %eax
	andl	$128, %eax
	testl	%eax, %eax
	setne	%al
	movzbl	%al, %eax
	pushl	%eax
	call	tty_putInt
	addl	$4, %esp
	incl	-4(%ebp)
.L278:
	cmpl	$7, -4(%ebp)
	jle	.L279
	nop
	nop
	leave
	ret
	.size	print_bin, .-print_bin
	.section	.rodata
	.align 4
.LC2:
	.string	"... Checking disk\n-- Waiting BSY\n"
.LC3:
	.string	"Drive does not exist"
.LC4:
	.string	"-- Waiting DRQ\n"
	.align 4
.LC5:
	.string	"-- Reading Drive Format Status\n"
.LC6:
	.string	"\nUnsupported drive format"
.LC7:
	.string	"... IDENT failiure\n"
.LC8:
	.string	"... IDENT succesful\n"
	.text
	.globl	ata_send_identify
	.type	ata_send_identify, @function
ata_send_identify:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$16, %esp
	pushl	$160
	pushl	$502
	call	outb
	addl	$8, %esp
	pushl	$0
	pushl	$498
	call	outb
	addl	$8, %esp
	pushl	$0
	pushl	$499
	call	outb
	addl	$8, %esp
	pushl	$0
	pushl	$500
	call	outb
	addl	$8, %esp
	pushl	$0
	pushl	$501
	call	outb
	addl	$8, %esp
	pushl	$236
	pushl	$503
	call	outb
	addl	$8, %esp
	pushl	$.LC2
	call	tty_putString
	addl	$4, %esp
	pushl	$503
	call	inb
	addl	$4, %esp
	testb	%al, %al
	jne	.L291
	pushl	$.LC3
	call	tty_putString
	addl	$4, %esp
.L291:
	nop
.L282:
	pushl	$503
	call	inb
	addl	$4, %esp
	testb	%al, %al
	js	.L282
	pushl	$.LC4
	call	tty_putString
	addl	$4, %esp
	nop
.L283:
	pushl	$503
	call	inb
	addl	$4, %esp
	movzbl	%al, %eax
	andl	$8, %eax
	testl	%eax, %eax
	je	.L283
	pushl	$.LC5
	call	tty_putString
	addl	$4, %esp
	pushl	$500
	call	inb
	addl	$4, %esp
	testb	%al, %al
	jne	.L284
	pushl	$501
	call	inb
	addl	$4, %esp
	testb	%al, %al
	je	.L292
.L284:
	pushl	$.LC6
	call	tty_putString
	addl	$4, %esp
.L292:
	nop
.L286:
	pushl	$503
	call	inb
	addl	$4, %esp
	movzbl	%al, %eax
	andl	$8, %eax
	testl	%eax, %eax
	je	.L286
	pushl	$503
	call	inb
	addl	$4, %esp
	movzbl	%al, %eax
	andl	$1, %eax
	testl	%eax, %eax
	je	.L287
	pushl	$.LC7
	call	tty_putString
	addl	$4, %esp
	jmp	.L288
.L287:
	pushl	$.LC8
	call	tty_putString
	addl	$4, %esp
.L288:
	movl	$0, -4(%ebp)
	jmp	.L289
.L290:
	pushl	$496
	call	inw
	addl	$4, %esp
	movl	8(%ebp), %edx
	movw	%ax, (%edx)
	addl	$2, 8(%ebp)
.L289:
	movl	-4(%ebp), %eax
	leal	1(%eax), %edx
	movl	%edx, -4(%ebp)
	cmpl	$255, %eax
	jle	.L290
	nop
	nop
	leave
	ret
	.size	ata_send_identify, .-ata_send_identify
	.globl	ata_read_sector
	.type	ata_read_sector, @function
ata_read_sector:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%ebx
	subl	$16, %esp
	movl	12(%ebp), %eax
	shrl	$24, %eax
	andl	$15, %eax
	orl	$-32, %eax
	movzbl	%al, %eax
	pushl	%eax
	pushl	$502
	call	outb
	addl	$8, %esp
	nop
.L294:
	pushl	$503
	call	inb
	addl	$4, %esp
	movzbl	%al, %eax
	andl	$64, %eax
	testl	%eax, %eax
	je	.L294
	pushl	$224
	pushl	$502
	call	outb
	addl	$8, %esp
	movb	sector_count, %al
	movzbl	%al, %eax
	pushl	%eax
	pushl	$498
	call	outb
	addl	$8, %esp
	movl	12(%ebp), %eax
	movzbl	%al, %eax
	pushl	%eax
	pushl	$499
	call	outb
	addl	$8, %esp
	movl	12(%ebp), %eax
	shrl	$8, %eax
	movzbl	%al, %eax
	pushl	%eax
	pushl	$500
	call	outb
	addl	$8, %esp
	movl	12(%ebp), %eax
	shrl	$16, %eax
	movzbl	%al, %eax
	pushl	%eax
	pushl	$501
	call	outb
	addl	$8, %esp
	pushl	$32
	pushl	$503
	call	outb
	addl	$8, %esp
	nop
.L295:
	pushl	$503
	call	inb
	addl	$4, %esp
	testb	%al, %al
	js	.L295
	nop
.L296:
	pushl	$503
	call	inb
	addl	$4, %esp
	movzbl	%al, %eax
	andl	$8, %eax
	testl	%eax, %eax
	je	.L296
	movl	$0, -8(%ebp)
	jmp	.L297
.L298:
	movl	-8(%ebp), %eax
	addl	%eax, %eax
	movl	%eax, %edx
	movl	8(%ebp), %eax
	leal	(%edx,%eax), %ebx
	pushl	$496
	call	inw
	addl	$4, %esp
	movw	%ax, (%ebx)
	incl	-8(%ebp)
.L297:
	cmpl	$255, -8(%ebp)
	jle	.L298
	nop
	nop
	movl	-4(%ebp), %ebx
	leave
	ret
	.size	ata_read_sector, .-ata_read_sector
	.globl	ata_read_sector_u8
	.type	ata_read_sector_u8, @function
ata_read_sector_u8:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$16, %esp
	movl	12(%ebp), %eax
	shrl	$24, %eax
	andl	$15, %eax
	orl	$-32, %eax
	movzbl	%al, %eax
	pushl	%eax
	pushl	$502
	call	outb
	addl	$8, %esp
	nop
.L300:
	pushl	$503
	call	inb
	addl	$4, %esp
	movzbl	%al, %eax
	andl	$64, %eax
	testl	%eax, %eax
	je	.L300
	pushl	$224
	pushl	$502
	call	outb
	addl	$8, %esp
	movb	sector_count, %al
	movzbl	%al, %eax
	pushl	%eax
	pushl	$498
	call	outb
	addl	$8, %esp
	movl	12(%ebp), %eax
	movzbl	%al, %eax
	pushl	%eax
	pushl	$499
	call	outb
	addl	$8, %esp
	movl	12(%ebp), %eax
	shrl	$8, %eax
	movzbl	%al, %eax
	pushl	%eax
	pushl	$500
	call	outb
	addl	$8, %esp
	movl	12(%ebp), %eax
	shrl	$16, %eax
	movzbl	%al, %eax
	pushl	%eax
	pushl	$501
	call	outb
	addl	$8, %esp
	pushl	$32
	pushl	$503
	call	outb
	addl	$8, %esp
	nop
.L301:
	pushl	$503
	call	inb
	addl	$4, %esp
	testb	%al, %al
	js	.L301
	nop
.L302:
	pushl	$503
	call	inb
	addl	$4, %esp
	movzbl	%al, %eax
	andl	$8, %eax
	testl	%eax, %eax
	je	.L302
	movl	$0, -4(%ebp)
	jmp	.L303
.L304:
	pushl	$496
	call	inw
	addl	$4, %esp
	movw	%ax, -6(%ebp)
	movl	-4(%ebp), %eax
	leal	1(%eax), %edx
	movl	%edx, -4(%ebp)
	movl	%eax, %edx
	movl	8(%ebp), %eax
	addl	%eax, %edx
	movw	-6(%ebp), %ax
	movb	%al, (%edx)
	movw	-6(%ebp), %ax
	shrw	$8, %ax
	movl	%eax, %edx
	movl	-4(%ebp), %eax
	leal	1(%eax), %ecx
	movl	%ecx, -4(%ebp)
	movl	%eax, %ecx
	movl	8(%ebp), %eax
	addl	%ecx, %eax
	movb	%dl, (%eax)
.L303:
	cmpl	$511, -4(%ebp)
	jle	.L304
	nop
	nop
	leave
	ret
	.size	ata_read_sector_u8, .-ata_read_sector_u8
	.globl	ata_write_sector
	.type	ata_write_sector, @function
ata_write_sector:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$16, %esp
	nop
.L306:
	pushl	$503
	call	inb
	addl	$4, %esp
	testb	%al, %al
	js	.L306
	movl	12(%ebp), %eax
	shrl	$24, %eax
	andl	$15, %eax
	orl	$-32, %eax
	movzbl	%al, %eax
	pushl	%eax
	pushl	$502
	call	outb
	addl	$8, %esp
	movb	sector_count, %al
	movzbl	%al, %eax
	pushl	%eax
	pushl	$498
	call	outb
	addl	$8, %esp
	movl	12(%ebp), %eax
	movzbl	%al, %eax
	pushl	%eax
	pushl	$499
	call	outb
	addl	$8, %esp
	movl	12(%ebp), %eax
	shrl	$8, %eax
	movzbl	%al, %eax
	pushl	%eax
	pushl	$500
	call	outb
	addl	$8, %esp
	movl	12(%ebp), %eax
	shrl	$16, %eax
	movzbl	%al, %eax
	pushl	%eax
	pushl	$501
	call	outb
	addl	$8, %esp
	pushl	$48
	pushl	$503
	call	outb
	addl	$8, %esp
	pushl	$48
	pushl	$503
	call	outb
	addl	$8, %esp
	movl	$0, -4(%ebp)
	jmp	.L307
.L312:
	nop
.L308:
	pushl	$503
	call	inb
	addl	$4, %esp
	testb	%al, %al
	js	.L308
	nop
.L309:
	pushl	$503
	call	inb
	addl	$4, %esp
	movzbl	%al, %eax
	andl	$8, %eax
	testl	%eax, %eax
	je	.L309
	movl	-4(%ebp), %eax
	addl	%eax, %eax
	movl	%eax, %edx
	movl	8(%ebp), %eax
	addl	%edx, %eax
	movw	(%eax), %ax
	movzwl	%ax, %eax
	pushl	%eax
	pushl	$496
	call	outl
	addl	$8, %esp
	movl	$0, -8(%ebp)
	jmp	.L310
.L311:
/APP
/  139 "kernel/../libs/disk/ata.c" 1
	nop
/  0 "" 2
/NO_APP
	incl	-8(%ebp)
.L310:
	cmpl	$99, -8(%ebp)
	jle	.L311
	incl	-4(%ebp)
.L307:
	cmpl	$255, -4(%ebp)
	jle	.L312
	nop
	nop
	leave
	ret
	.size	ata_write_sector, .-ata_write_sector
	.local	bpb_buffer
	.comm	bpb_buffer,512,32
	.local	bpb_info
	.comm	bpb_info,90,32
	.local	FAT_info
	.comm	FAT_info,32,32
	.section	.rodata
.LC9:
	.string	"ERROR - ONLY FAT32 ALLOWED"
	.text
	.globl	bpb_init
	.type	bpb_init, @function
bpb_init:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	pushl	$2048
	pushl	$bpb_buffer
	call	ata_read_sector_u8
	addl	$8, %esp
	movl	$bpb_buffer, %eax
	movl	$bpb_info, %edx
	movl	%eax, %ebx
	movl	$90, %eax
	movl	%edx, %edi
	movl	%ebx, %esi
	movl	%eax, %ecx
	rep movsb
	movw	bpb_info+22, %ax
	testw	%ax, %ax
	je	.L314
	pushl	$.LC9
	call	tty_putString
	addl	$4, %esp
/APP
/  17 "kernel/../libs/disk/bpb.c" 1
	cli; hlt;
/  0 "" 2
/NO_APP
.L314:
	movl	bpb_info+32, %eax
	movl	%eax, FAT_info+4
	movl	bpb_info+36, %eax
	movl	%eax, FAT_info+8
	movw	bpb_info+17, %ax
	movzwl	%ax, %eax
	sall	$5, %eax
	movl	%eax, %edx
	movw	bpb_info+11, %ax
	movzwl	%ax, %eax
	decl	%eax
	leal	(%edx,%eax), %ecx
	movw	bpb_info+11, %ax
	movzwl	%ax, %esi
	movl	%ecx, %eax
	cltd
	idivl	%esi
	movl	%eax, FAT_info
	movw	bpb_info+14, %ax
	movzwl	%ax, %edx
	movb	bpb_info+16, %al
	movzbl	%al, %ecx
	movl	FAT_info+8, %eax
	imull	%ecx, %eax
	addl	%eax, %edx
	movl	FAT_info, %eax
	addl	%edx, %eax
	movl	%eax, FAT_info+16
	movw	bpb_info+14, %ax
	movzwl	%ax, %eax
	movl	%eax, FAT_info+12
	movl	FAT_info+4, %edx
	movw	bpb_info+14, %ax
	movzwl	%ax, %ecx
	movb	bpb_info+16, %al
	movzbl	%al, %ebx
	movl	FAT_info+8, %eax
	imull	%ebx, %eax
	addl	%eax, %ecx
	movl	FAT_info, %eax
	addl	%eax, %ecx
	movl	%edx, %eax
	subl	%ecx, %eax
	movl	%eax, FAT_info+20
	movl	FAT_info+20, %eax
	movb	bpb_info+13, %dl
	movzbl	%dl, %edi
	movl	$0, %edx
	divl	%edi
	movl	%eax, FAT_info+24
	movl	FAT_info+16, %eax
	movl	FAT_info, %edx
	subl	%edx, %eax
	movl	%eax, FAT_info+28
	nop
	leal	-12(%ebp), %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	popl	%ebp
	ret
	.size	bpb_init, .-bpb_init
	.globl	FAT_first_sector_of_cluster
	.type	FAT_first_sector_of_cluster, @function
FAT_first_sector_of_cluster:
	pushl	%ebp
	movl	%esp, %ebp
	movl	8(%ebp), %eax
	leal	-2(%eax), %edx
	movb	bpb_info+13, %al
	movzbl	%al, %eax
	imull	%eax, %edx
	movl	FAT_info+16, %eax
	addl	%edx, %eax
	popl	%ebp
	ret
	.size	FAT_first_sector_of_cluster, .-FAT_first_sector_of_cluster
	.type	FAT_clusterToGlobalSector, @function
FAT_clusterToGlobalSector:
	pushl	%ebp
	movl	%esp, %ebp
	movl	8(%ebp), %eax
	addl	$2048, %eax
	pushl	%eax
	call	FAT_first_sector_of_cluster
	addl	$4, %esp
	leave
	ret
	.size	FAT_clusterToGlobalSector, .-FAT_clusterToGlobalSector
	.type	FAT_readFirstSectorOfCluster, @function
FAT_readFirstSectorOfCluster:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	12(%ebp)
	call	FAT_clusterToGlobalSector
	addl	$4, %esp
	pushl	%eax
	pushl	8(%ebp)
	call	ata_read_sector_u8
	addl	$8, %esp
	nop
	leave
	ret
	.size	FAT_readFirstSectorOfCluster, .-FAT_readFirstSectorOfCluster
	.globl	FAT_get_entry_from_cluster
	.type	FAT_get_entry_from_cluster, @function
FAT_get_entry_from_cluster:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%ebx
	subl	$16, %esp
	movl	12(%ebp), %eax
	sall	$2, %eax
	movl	%eax, -8(%ebp)
	movw	bpb_info+14, %ax
	movzwl	%ax, %ecx
	movw	bpb_info+11, %ax
	movzwl	%ax, %ebx
	movl	-8(%ebp), %eax
	movl	$0, %edx
	divl	%ebx
	leal	(%ecx,%eax), %edx
	movl	8(%ebp), %eax
	movl	%edx, (%eax)
	movw	bpb_info+11, %ax
	movzwl	%ax, %ecx
	movl	-8(%ebp), %eax
	movl	$0, %edx
	divl	%ecx
	movl	8(%ebp), %eax
	movl	%edx, 4(%eax)
	nop
	movl	-4(%ebp), %ebx
	leave
	ret
	.size	FAT_get_entry_from_cluster, .-FAT_get_entry_from_cluster
	.globl	FAT_get_cluster_num
	.type	FAT_get_cluster_num, @function
FAT_get_cluster_num:
	pushl	%ebp
	movl	%esp, %ebp
	movl	8(%ebp), %eax
	movw	26(%eax), %ax
	movzwl	%ax, %edx
	movl	8(%ebp), %eax
	movl	20(%eax), %eax
	movzwl	%ax, %eax
	sall	$16, %eax
	orl	%edx, %eax
	popl	%ebp
	ret
	.size	FAT_get_cluster_num, .-FAT_get_cluster_num
	.section	.rodata
.LC10:
	.string	"END"
.LC11:
	.string	"UNUSED"
.LC12:
	.string	"MULTIPLE LFN NOT IMPLEMENTED"
	.text
	.globl	FAT_readEntry
	.type	FAT_readEntry, @function
FAT_readEntry:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$48, %esp
	movl	8(%ebp), %eax
	movb	(%eax), %al
	testb	%al, %al
	jne	.L324
	pushl	$.LC10
	call	tty_putString_nl
	addl	$4, %esp
	movl	$0, %eax
	jmp	.L325
.L324:
	movl	8(%ebp), %eax
	movb	(%eax), %al
	cmpb	$-27, %al
	jne	.L326
	pushl	$.LC11
	call	tty_putString_nl
	addl	$4, %esp
	movl	$0, %eax
	jmp	.L325
.L326:
	pushl	$44
	call	malloc
	addl	$4, %esp
	movl	%eax, -28(%ebp)
	movl	8(%ebp), %eax
	addl	$11, %eax
	movb	(%eax), %al
	cmpb	$15, %al
	jne	.L327
	movl	$0, -16(%ebp)
	movl	$0, -20(%ebp)
.L328:
	movl	-16(%ebp), %eax
	sall	$5, %eax
	movl	%eax, %edx
	movl	8(%ebp), %eax
	addl	%edx, %eax
	movl	%eax, -44(%ebp)
	movl	-44(%ebp), %eax
	leal	1(%eax), %edx
	movl	-20(%ebp), %eax
	addl	$outputName16.3, %eax
	pushl	$10
	pushl	%edx
	pushl	%eax
	call	memcpy
	addl	$12, %esp
	movl	-44(%ebp), %eax
	leal	14(%eax), %edx
	movl	-20(%ebp), %eax
	addl	$10, %eax
	addl	$outputName16.3, %eax
	pushl	$12
	pushl	%edx
	pushl	%eax
	call	memcpy
	addl	$12, %esp
	movl	-44(%ebp), %eax
	leal	28(%eax), %edx
	movl	-20(%ebp), %eax
	addl	$22, %eax
	addl	$outputName16.3, %eax
	pushl	$4
	pushl	%edx
	pushl	%eax
	call	memcpy
	addl	$12, %esp
	movl	-44(%ebp), %eax
	movb	(%eax), %al
	movzbl	%al, %eax
	andl	$64, %eax
	testl	%eax, %eax
	jne	.L329
	pushl	$.LC12
	call	tty_putString_nl
	addl	$4, %esp
	addl	$32, -16(%ebp)
	addl	$22, -20(%ebp)
	jmp	.L328
.L329:
	movl	-20(%ebp), %eax
	leal	1(%eax), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	movb	$0, outputName16.3(%eax)
	movl	$0, -24(%ebp)
	jmp	.L330
.L331:
	movl	-24(%ebp), %eax
	addl	%eax, %eax
	movb	outputName16.3(%eax), %al
	movl	-24(%ebp), %edx
	addl	$outputName8.2, %edx
	movb	%al, (%edx)
	incl	-24(%ebp)
.L330:
	cmpl	$13, -24(%ebp)
	jle	.L331
	pushl	$outputName8.2
	call	strlen
	addl	$4, %esp
	incl	%eax
	movl	%eax, -48(%ebp)
	movl	-48(%ebp), %eax
	movzwl	%ax, %eax
	pushl	%eax
	call	malloc
	addl	$4, %esp
	movl	%eax, -52(%ebp)
	pushl	-48(%ebp)
	pushl	$outputName8.2
	pushl	-52(%ebp)
	call	memcpy
	addl	$12, %esp
	movl	-16(%ebp), %eax
	incl	%eax
	sall	$5, %eax
	movl	%eax, %edx
	movl	8(%ebp), %eax
	addl	%edx, %eax
	movl	%eax, -32(%ebp)
	movl	-28(%ebp), %edx
	movl	-32(%ebp), %eax
	addl	$12, %edx
	movl	%eax, %ebx
	movl	$8, %eax
	movl	%edx, %edi
	movl	%ebx, %esi
	movl	%eax, %ecx
	rep movsl
	movl	-28(%ebp), %eax
	movl	-52(%ebp), %edx
	movl	%edx, (%eax)
	movl	-32(%ebp), %eax
	movb	11(%eax), %al
	cmpb	$16, %al
	sete	%al
	movzbl	%al, %edx
	movl	-28(%ebp), %eax
	movl	%edx, 8(%eax)
	movl	-28(%ebp), %eax
	movl	$64, 4(%eax)
	movl	-28(%ebp), %eax
	jmp	.L325
.L327:
	movl	8(%ebp), %eax
	movl	%eax, -32(%ebp)
	movl	-32(%ebp), %eax
	pushl	$32
	pushl	%eax
	call	strcut
	addl	$8, %esp
	incl	%eax
	movl	%eax, -36(%ebp)
	movl	-36(%ebp), %eax
	movzwl	%ax, %eax
	pushl	%eax
	call	malloc
	addl	$4, %esp
	movl	%eax, -40(%ebp)
	movl	-32(%ebp), %eax
	pushl	-36(%ebp)
	pushl	%eax
	pushl	-40(%ebp)
	call	memcpy
	addl	$12, %esp
	movl	-28(%ebp), %edx
	movl	-32(%ebp), %eax
	addl	$12, %edx
	movl	%eax, %ebx
	movl	$8, %eax
	movl	%edx, %edi
	movl	%ebx, %esi
	movl	%eax, %ecx
	rep movsl
	movl	-28(%ebp), %eax
	movl	-40(%ebp), %edx
	movl	%edx, (%eax)
	movl	-32(%ebp), %eax
	movb	11(%eax), %al
	cmpb	$16, %al
	sete	%al
	movzbl	%al, %edx
	movl	-28(%ebp), %eax
	movl	%edx, 8(%eax)
	movl	-28(%ebp), %eax
	movl	$32, 4(%eax)
	movl	-28(%ebp), %eax
.L325:
	leal	-12(%ebp), %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	popl	%ebp
	ret
	.size	FAT_readEntry, .-FAT_readEntry
	.globl	files_directoryTree
	.section	.bss
	.align 4
	.type	files_directoryTree, @object
	.size	files_directoryTree, 4
files_directoryTree:
	.zero	4
	.globl	currentSubDStack
	.align 4
	.type	currentSubDStack, @object
	.size	currentSubDStack, 4
currentSubDStack:
	.zero	4
	.globl	temp_allNames
	.align 32
	.type	temp_allNames, @object
	.size	temp_allNames, 800
temp_allNames:
	.zero	800
	.globl	temp_namesCount
	.align 4
	.type	temp_namesCount, @object
	.size	temp_namesCount, 4
temp_namesCount:
	.zero	4
	.section	.rodata
.LC13:
	.string	"adding directory: "
.LC14:
	.string	"entering nest: "
.LC15:
	.string	"adding file     : "
	.text
	.globl	searchDir
	.type	searchDir, @function
searchDir:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$24, %esp
	movl	$0, -12(%ebp)
	pushl	8(%ebp)
	call	FAT_readEntry
	addl	$4, %esp
	movl	%eax, -16(%ebp)
	jmp	.L333
.L336:
	movl	-16(%ebp), %eax
	movl	8(%eax), %eax
	testl	%eax, %eax
	je	.L334
	pushl	$.LC13
	call	tty_putString
	addl	$4, %esp
	movl	-16(%ebp), %eax
	movl	(%eax), %eax
	pushl	%eax
	call	tty_putString_nl
	addl	$4, %esp
	movl	-16(%ebp), %eax
	addl	$12, %eax
	pushl	%eax
	call	FAT_get_cluster_num
	addl	$4, %esp
	movl	%eax, -20(%ebp)
	cmpl	$0, -20(%ebp)
	je	.L335
	cmpl	$-1, -20(%ebp)
	je	.L335
	pushl	$.LC14
	call	tty_putString
	addl	$4, %esp
	pushl	-20(%ebp)
	call	tty_putInt_nl
	addl	$4, %esp
	pushl	$512
	call	malloc
	addl	$4, %esp
	movl	%eax, -24(%ebp)
	pushl	-20(%ebp)
	pushl	-24(%ebp)
	call	FAT_readFirstSectorOfCluster
	addl	$8, %esp
	movl	-24(%ebp), %eax
	addl	$96, %eax
	subl	$12, %esp
	pushl	%eax
	call	searchDir
	addl	$16, %esp
	subl	$12, %esp
	pushl	-24(%ebp)
	call	free
	addl	$16, %esp
	jmp	.L335
.L334:
	subl	$12, %esp
	pushl	$.LC15
	call	tty_putString
	addl	$16, %esp
	movl	-16(%ebp), %eax
	movl	(%eax), %eax
	subl	$12, %esp
	pushl	%eax
	call	tty_putString_nl
	addl	$16, %esp
.L335:
	movl	-16(%ebp), %eax
	movl	(%eax), %eax
	subl	$4, %esp
	pushl	%eax
	pushl	-16(%ebp)
	pushl	$files_directoryTree
	call	linked_dict_add
	addl	$16, %esp
	movl	temp_namesCount, %eax
	leal	1(%eax), %edx
	movl	%edx, temp_namesCount
	movl	-16(%ebp), %edx
	movl	(%edx), %edx
	movl	%edx, temp_allNames(,%eax,4)
	movl	-16(%ebp), %eax
	movl	4(%eax), %eax
	addl	%eax, -12(%ebp)
	movl	8(%ebp), %edx
	movl	-12(%ebp), %eax
	addl	%edx, %eax
	subl	$12, %esp
	pushl	%eax
	call	FAT_readEntry
	addl	$16, %esp
	movl	%eax, -16(%ebp)
.L333:
	cmpl	$0, -16(%ebp)
	jne	.L336
	nop
	nop
	leave
	ret
	.size	searchDir, .-searchDir
	.globl	dirnameFirstSlash
	.type	dirnameFirstSlash, @function
dirnameFirstSlash:
	pushl	%ebp
	movl	%esp, %ebp
	jmp	.L338
.L341:
	movl	8(%ebp), %eax
	movb	(%eax), %al
	testb	%al, %al
	jne	.L339
	movl	$0, %eax
	jmp	.L340
.L339:
	incl	8(%ebp)
.L338:
	movl	8(%ebp), %eax
	movb	(%eax), %al
	cmpb	$47, %al
	jne	.L341
	movl	8(%ebp), %eax
	movb	$0, (%eax)
	movl	8(%ebp), %eax
	incl	%eax
.L340:
	popl	%ebp
	ret
	.size	dirnameFirstSlash, .-dirnameFirstSlash
	.section	.rodata
.LC16:
	.string	"checking directory: "
.LC17:
	.string	"is equal"
	.text
	.globl	findDirInDir
	.type	findDirInDir, @function
findDirInDir:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$16, %esp
	pushl	12(%ebp)
	call	FAT_readEntry
	addl	$4, %esp
	movl	%eax, file.1
	movl	$0, -4(%ebp)
	jmp	.L343
.L346:
	movl	file.1, %eax
	movl	8(%eax), %eax
	testl	%eax, %eax
	je	.L344
	pushl	$.LC16
	call	tty_putString
	addl	$4, %esp
	movl	file.1, %eax
	movl	(%eax), %eax
	pushl	%eax
	call	tty_putString_nl
	addl	$4, %esp
	movl	file.1, %eax
	movl	(%eax), %eax
	pushl	8(%ebp)
	pushl	%eax
	call	strcmp
	addl	$8, %esp
	testl	%eax, %eax
	jne	.L344
	pushl	$.LC17
	call	tty_putString_nl
	addl	$4, %esp
	movl	file.1, %eax
	jmp	.L345
.L344:
	movl	file.1, %eax
	movl	4(%eax), %eax
	addl	%eax, -4(%ebp)
	movl	file.1, %eax
	pushl	%eax
	call	free
	addl	$4, %esp
	movl	12(%ebp), %edx
	movl	-4(%ebp), %eax
	addl	%edx, %eax
	pushl	%eax
	call	FAT_readEntry
	addl	$4, %esp
	movl	%eax, file.1
.L343:
	movl	file.1, %eax
	testl	%eax, %eax
	jne	.L346
	movl	$0, %eax
.L345:
	leave
	ret
	.size	findDirInDir, .-findDirInDir
	.section	.rodata
.LC18:
	.string	"directory found"
	.text
	.globl	findDirFromRoot
	.type	findDirFromRoot, @function
findDirFromRoot:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$16, %esp
	pushl	8(%ebp)
	call	dirnameFirstSlash
	addl	$4, %esp
	movl	%eax, -4(%ebp)
	movl	bpb_info+44, %eax
	movl	%eax, -8(%ebp)
.L348:
	pushl	-8(%ebp)
	pushl	$fsectBuff.0
	call	FAT_readFirstSectorOfCluster
	addl	$8, %esp
	pushl	$fsectBuff.0
	pushl	8(%ebp)
	call	findDirInDir
	addl	$8, %esp
	movl	%eax, -12(%ebp)
	movl	-12(%ebp), %eax
	addl	$12, %eax
	pushl	%eax
	call	FAT_get_cluster_num
	addl	$4, %esp
	movl	%eax, -8(%ebp)
	movl	-4(%ebp), %eax
	movl	%eax, 8(%ebp)
	cmpl	$0, 8(%ebp)
	je	.L349
	pushl	8(%ebp)
	call	dirnameFirstSlash
	addl	$4, %esp
	movl	%eax, -4(%ebp)
	pushl	8(%ebp)
	call	tty_putString_nl
	addl	$4, %esp
	pushl	-12(%ebp)
	call	free
	addl	$4, %esp
	jmp	.L348
.L349:
	pushl	-8(%ebp)
	pushl	$fsectBuff.0
	call	FAT_readFirstSectorOfCluster
	addl	$8, %esp
	pushl	$.LC18
	call	tty_putString_nl
	addl	$4, %esp
	pushl	-12(%ebp)
	call	free
	addl	$4, %esp
	movl	$fsectBuff.0, %eax
	leave
	ret
	.size	findDirFromRoot, .-findDirFromRoot
	.section	.rodata
.LC19:
	.string	"testing "
.LC20:
	.string	"CHECKING:::"
.LC21:
	.string	"found!"
	.text
	.globl	readFile
	.type	readFile, @function
readFile:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$32, %esp
	pushl	8(%ebp)
	call	findDirFromRoot
	addl	$4, %esp
	movl	%eax, -16(%ebp)
	movl	$0, -4(%ebp)
	pushl	-16(%ebp)
	call	FAT_readEntry
	addl	$4, %esp
	movl	%eax, -8(%ebp)
	jmp	.L352
.L360:
	pushl	$.LC19
	call	tty_putString
	addl	$4, %esp
	movl	-8(%ebp), %eax
	movl	(%eax), %eax
	pushl	%eax
	call	tty_putString_nl
	addl	$4, %esp
	movl	-8(%ebp), %eax
	movl	8(%eax), %eax
	testl	%eax, %eax
	jne	.L353
	pushl	$.LC20
	call	tty_putString
	addl	$4, %esp
	movl	-8(%ebp), %eax
	movl	(%eax), %eax
	pushl	%eax
	call	tty_putString_nl
	addl	$4, %esp
	movl	-8(%ebp), %eax
	movl	(%eax), %eax
	pushl	12(%ebp)
	pushl	%eax
	call	strcmp
	addl	$8, %esp
	testl	%eax, %eax
	jne	.L353
	pushl	$.LC21
	call	tty_putString_nl
	addl	$4, %esp
	cmpl	$-1, 20(%ebp)
	jne	.L354
	movl	-8(%ebp), %eax
	movl	40(%eax), %eax
	movl	%eax, 20(%ebp)
.L354:
	movl	20(%ebp), %eax
	movl	%eax, -20(%ebp)
	movl	-8(%ebp), %eax
	addl	$12, %eax
	pushl	%eax
	call	FAT_get_cluster_num
	addl	$4, %esp
	movl	%eax, -12(%ebp)
	pushl	-12(%ebp)
	pushl	-16(%ebp)
	call	FAT_readFirstSectorOfCluster
	addl	$8, %esp
	cmpl	$511, 20(%ebp)
	jg	.L357
	movl	20(%ebp), %eax
	pushl	%eax
	pushl	-16(%ebp)
	pushl	16(%ebp)
	call	memcpy
	addl	$12, %esp
	pushl	-8(%ebp)
	call	free
	addl	$4, %esp
	movl	-20(%ebp), %eax
	jmp	.L356
.L359:
	movl	20(%ebp), %eax
	cmpl	$512, %eax
	jle	.L358
	movl	$512, %eax
.L358:
	pushl	%eax
	pushl	-16(%ebp)
	pushl	16(%ebp)
	call	memcpy
	addl	$12, %esp
	addl	$512, 16(%ebp)
	subl	$512, 20(%ebp)
	incl	-12(%ebp)
	pushl	-12(%ebp)
	pushl	-16(%ebp)
	call	FAT_readFirstSectorOfCluster
	addl	$8, %esp
	pushl	-8(%ebp)
	call	free
	addl	$4, %esp
.L357:
	cmpl	$0, 20(%ebp)
	jg	.L359
	movl	-20(%ebp), %eax
	jmp	.L356
.L353:
	movl	-8(%ebp), %eax
	movl	4(%eax), %eax
	addl	%eax, -4(%ebp)
	pushl	-8(%ebp)
	call	free
	addl	$4, %esp
	movl	-16(%ebp), %edx
	movl	-4(%ebp), %eax
	addl	%edx, %eax
	pushl	%eax
	call	FAT_readEntry
	addl	$4, %esp
	movl	%eax, -8(%ebp)
.L352:
	cmpl	$0, -8(%ebp)
	jne	.L360
	movl	$0, %eax
.L356:
	leave
	ret
	.size	readFile, .-readFile
	.section	.rodata
.LC22:
	.string	"CREATING FS DIRECTORIES\n"
.LC23:
	.string	"printHello"
.LC24:
	.string	"test/test2"
	.text
	.globl	run_disk_test
	.type	run_disk_test, @function
run_disk_test:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$16, %esp
	pushl	$480
	pushl	$640
	pushl	$0
	pushl	$0
	call	gfx_clearRect
	addl	$16, %esp
	pushl	$31
	pushl	$63
	pushl	$31
	pushl	$gfx_current_ctx
	call	gfx_init_ctx
	addl	$16, %esp
	pushl	$tty_current_ctx
	pushl	$gfx_current_ctx
	pushl	$65
	pushl	$0
	pushl	$0
	call	tty_init_ctx
	addl	$20, %esp
	pushl	$.LC22
	call	tty_putString
	addl	$4, %esp
	call	bpb_init
	pushl	$1000
	call	malloc
	addl	$4, %esp
	movl	%eax, -4(%ebp)
	pushl	$-1
	pushl	-4(%ebp)
	pushl	$.LC23
	pushl	$.LC24
	call	readFile
	addl	$16, %esp
	movl	%eax, -8(%ebp)
	pushl	-8(%ebp)
	call	tty_putInt_nl
	addl	$4, %esp
	pushl	-8(%ebp)
	pushl	-4(%ebp)
	call	elf_getHeaderInfo
	addl	$8, %esp
	movl	%eax, -12(%ebp)
	movl	-12(%ebp), %eax
	movl	4(%eax), %eax
	pushl	%eax
	call	tty_putInt_nl
	addl	$4, %esp
	movl	-12(%ebp), %eax
	movl	12(%eax), %eax
	pushl	%eax
	call	tty_putInt_nl
	addl	$4, %esp
	pushl	-12(%ebp)
	call	elf_exec
	addl	$4, %esp
/APP
/  211 "kernel/../libs/disk/files.c" 1
	mov $0, %eax; int $49
/  0 "" 2
/NO_APP
	nop
	leave
	ret
	.size	run_disk_test, .-run_disk_test
	.section	.rodata
.LC25:
	.string	"hello, testing syscall"
	.text
	.globl	_syscall_puts
	.type	_syscall_puts, @function
_syscall_puts:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	$20
	pushl	$20
	pushl	$.LC25
	call	gfx_drawString
	addl	$12, %esp
	nop
	leave
	ret
	.size	_syscall_puts, .-_syscall_puts
	.globl	syscalls
	.section	.bss
	.align 32
	.type	syscalls, @object
	.size	syscalls, 1024
syscalls:
	.zero	1024
	.text
	.globl	syscall_create
	.type	syscall_create, @function
syscall_create:
	pushl	%ebp
	movl	%esp, %ebp
	movl	12(%ebp), %eax
	movl	8(%ebp), %edx
	movl	%edx, syscalls(,%eax,4)
	nop
	popl	%ebp
	ret
	.size	syscall_create, .-syscall_create
	.globl	syscall
	.type	syscall, @function
syscall:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$28, %esp
	movl	36(%ebp), %eax
	movl	syscalls(,%eax,4), %eax
	movl	%eax, -28(%ebp)
	subl	$4, %esp
	subl	$60, %esp
	movl	%esp, %eax
	movl	%eax, %edx
	leal	8(%ebp), %ebx
	movl	$15, %eax
	movl	%edx, %edi
	movl	%ebx, %esi
	movl	%eax, %ecx
	rep movsl
	movl	-28(%ebp), %eax
	call	*%eax
	addl	$64, %esp
	nop
	leal	-12(%ebp), %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	popl	%ebp
	ret
	.size	syscall, .-syscall
	.globl	syscalls_init
	.type	syscalls_init, @function
syscalls_init:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	$0
	pushl	$_syscall_puts
	call	syscall_create
	addl	$8, %esp
	pushl	$syscall
	pushl	$17
	call	idt_load_interrupt
	addl	$8, %esp
	nop
	leave
	ret
	.size	syscalls_init, .-syscalls_init
	.globl	desktop_background_color
	.data
	.align 2
	.type	desktop_background_color, @object
	.size	desktop_background_color, 2
desktop_background_color:
	.value	-13135
	.align 4
	.type	taskbar_data, @object
	.size	taskbar_data, 16
taskbar_data:
	.long	590
	.long	50
	.long	25
	.long	420
	.text
	.globl	taskbar_adjust
	.type	taskbar_adjust, @function
taskbar_adjust:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$16, %esp
	movl	8(%ebp), %eax
	shrl	%eax
	movl	$320, %edx
	movl	%edx, %ecx
	subl	%eax, %ecx
	movl	$470, %eax
	subl	12(%ebp), %eax
	movl	8(%ebp), %edx
	movl	%edx, taskbar_data
	movl	12(%ebp), %edx
	movl	%edx, taskbar_data+4
	movl	%ecx, taskbar_data+8
	movl	%eax, taskbar_data+12
	nop
	leave
	ret
	.size	taskbar_adjust, .-taskbar_adjust
	.globl	taskbar_render
	.type	taskbar_render, @function
taskbar_render:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%ebx
	movl	taskbar_data+4, %eax
	movl	%eax, %ebx
	movl	taskbar_data, %eax
	movl	%eax, %ecx
	movl	taskbar_data+12, %eax
	movl	%eax, %edx
	movl	taskbar_data+8, %eax
	pushl	$1
	pushl	$0
	pushl	$44725
	pushl	%ebx
	pushl	%ecx
	pushl	%edx
	pushl	%eax
	call	gfx_fillBorderedRect_col
	addl	$28, %esp
	nop
	movl	-4(%ebp), %ebx
	leave
	ret
	.size	taskbar_render, .-taskbar_render
	.globl	widget_text_create
	.type	widget_text_create, @function
widget_text_create:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%ebx
	subl	$16, %esp
	pushl	$8
	call	malloc
	addl	$4, %esp
	movl	%eax, -8(%ebp)
	movl	-8(%ebp), %eax
	movl	8(%ebp), %edx
	movl	%edx, (%eax)
	movl	-8(%ebp), %eax
	movl	12(%ebp), %edx
	movl	%edx, 4(%eax)
	movl	-8(%ebp), %eax
	movl	-4(%ebp), %ebx
	leave
	ret
	.size	widget_text_create, .-widget_text_create
	.globl	widget_text_render
	.type	widget_text_render, @function
widget_text_render:
	pushl	%ebp
	movl	%esp, %ebp
	movl	8(%ebp), %eax
	movl	4(%eax), %edx
	movl	20(%ebp), %eax
	addl	%edx, %eax
	addl	$20, %eax
	movl	%eax, %ecx
	movl	8(%ebp), %eax
	movl	(%eax), %edx
	movl	16(%ebp), %eax
	addl	%edx, %eax
	movl	%eax, %edx
	movl	12(%ebp), %eax
	movl	(%eax), %eax
	pushl	%ecx
	pushl	%edx
	pushl	%eax
	call	gfx_drawString
	addl	$12, %esp
	nop
	leave
	ret
	.size	widget_text_render, .-widget_text_render
	.globl	widget_append
	.type	widget_append, @function
widget_append:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$32, %esp
	pushl	$16
	call	malloc
	addl	$4, %esp
	movl	%eax, -4(%ebp)
	movl	-4(%ebp), %eax
	movl	20(%ebp), %edx
	movl	%edx, (%eax)
	movl	-4(%ebp), %eax
	movl	24(%ebp), %edx
	movl	%edx, 4(%eax)
	movl	-4(%ebp), %eax
	movl	12(%ebp), %edx
	movl	%edx, 8(%eax)
	movl	-4(%ebp), %eax
	movl	16(%ebp), %edx
	movl	%edx, 12(%eax)
	movl	8(%ebp), %eax
	addl	$24, %eax
	pushl	-4(%ebp)
	pushl	%eax
	call	linked_add
	addl	$8, %esp
	nop
	leave
	ret
	.size	widget_append, .-widget_append
	.globl	widget_drawAll
	.type	widget_drawAll, @function
widget_drawAll:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$16, %esp
	movl	8(%ebp), %eax
	movl	24(%eax), %eax
	movl	%eax, -4(%ebp)
	jmp	.L373
.L375:
	movl	-4(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, -8(%ebp)
	movl	-8(%ebp), %eax
	movl	8(%eax), %eax
	testl	%eax, %eax
	jne	.L374
	movl	-8(%ebp), %eax
	movl	4(%eax), %ecx
	movl	-8(%ebp), %eax
	movl	(%eax), %edx
	movl	-8(%ebp), %eax
	movl	12(%eax), %eax
	pushl	%ecx
	pushl	%edx
	pushl	%eax
	pushl	8(%ebp)
	call	widget_text_render
	addl	$16, %esp
.L374:
	movl	-4(%ebp), %eax
	movl	4(%eax), %eax
	movl	%eax, -4(%ebp)
.L373:
	cmpl	$0, -4(%ebp)
	jne	.L375
	nop
	nop
	leave
	ret
	.size	widget_drawAll, .-widget_drawAll
	.local	allWindows
	.comm	allWindows,4,4
	.local	wasClicked
	.comm	wasClicked,64,32
	.local	windowIsSelected
	.comm	windowIsSelected,1,1
	.section	.rodata
.LC26:
	.string	"- + X"
	.text
	.globl	window_draw
	.type	window_draw, @function
window_draw:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%esi
	pushl	%ebx
	subl	$16, %esp
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, -12(%ebp)
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	movl	%eax, -16(%ebp)
	movl	8(%ebp), %eax
	movl	8(%eax), %eax
	movl	%eax, -20(%ebp)
	movl	8(%ebp), %eax
	movl	12(%eax), %eax
	movl	%eax, -24(%ebp)
	movl	wasClicked, %eax
	cmpl	%eax, 8(%ebp)
	jne	.L377
	movl	$65535, %ebx
	jmp	.L378
.L377:
	movl	$55130, %ebx
.L378:
	movl	-20(%ebp), %ecx
	movl	-16(%ebp), %edx
	movl	-12(%ebp), %eax
	pushl	$1
	pushl	$0
	pushl	%ebx
	pushl	$20
	pushl	%ecx
	pushl	%edx
	pushl	%eax
	call	gfx_fillBorderedRect_col
	addl	$28, %esp
	movl	-16(%ebp), %eax
	movl	-12(%ebp), %ecx
	movl	-20(%ebp), %edx
	addl	%ecx, %edx
	subl	$60, %edx
	pushl	$GFX_DEFAULT_BLACK
	pushl	%eax
	pushl	%edx
	pushl	$.LC26
	call	gfx_drawTransparentString_ctx
	addl	$16, %esp
	movl	-16(%ebp), %edx
	movl	-12(%ebp), %eax
	addl	$5, %eax
	movl	%eax, %ecx
	movl	8(%ebp), %eax
	movl	16(%eax), %eax
	pushl	$GFX_DEFAULT_BLACK
	pushl	%edx
	pushl	%ecx
	pushl	%eax
	call	gfx_drawTransparentString_ctx
	addl	$16, %esp
	movl	8(%ebp), %eax
	movl	28(%eax), %ebx
	movl	-24(%ebp), %ecx
	movl	-20(%ebp), %edx
	movl	-16(%ebp), %eax
	addl	$19, %eax
	movl	%eax, %esi
	movl	-12(%ebp), %eax
	pushl	$1
	pushl	$0
	pushl	%ebx
	pushl	%ecx
	pushl	%edx
	pushl	%esi
	pushl	%eax
	call	gfx_fillBorderedRect_col
	addl	$28, %esp
	movl	-16(%ebp), %edx
	movl	-24(%ebp), %eax
	addl	%edx, %eax
	addl	$9, %eax
	movl	%eax, %edx
	movl	-12(%ebp), %ecx
	movl	-20(%ebp), %eax
	addl	%ecx, %eax
	subl	$10, %eax
	pushl	$1
	pushl	$0
	pushl	$44405
	pushl	$10
	pushl	$10
	pushl	%edx
	pushl	%eax
	call	gfx_fillBorderedRect_col
	addl	$28, %esp
	pushl	8(%ebp)
	call	widget_drawAll
	addl	$4, %esp
	nop
	leal	-8(%ebp), %esp
	popl	%ebx
	popl	%esi
	popl	%ebp
	ret
	.size	window_draw, .-window_draw
	.globl	window_render
	.type	window_render, @function
window_render:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$24, %esp
	pushl	8(%ebp)
	call	window_draw
	addl	$4, %esp
	movl	8(%ebp), %eax
	movl	20(%eax), %eax
	testl	%eax, %eax
	je	.L381
	movl	mouse_x, %eax
	movl	%eax, %ecx
	movl	8(%ebp), %eax
	movl	(%eax), %edx
	movl	%ecx, %eax
	subl	%edx, %eax
	movl	%eax, -24(%ebp)
	movl	mouse_y, %eax
	movl	%eax, %ecx
	movl	8(%ebp), %eax
	movl	4(%eax), %edx
	movl	%ecx, %eax
	subl	%edx, %eax
	movl	%eax, -20(%ebp)
	movl	8(%ebp), %eax
	movl	%eax, -16(%ebp)
	movl	$0, -12(%ebp)
	movl	8(%ebp), %eax
	movl	20(%eax), %eax
	movl	%eax, %edx
	subl	$12, %esp
	leal	-24(%ebp), %eax
	pushl	%eax
	call	*%edx
	addl	$16, %esp
.L381:
	nop
	leave
	ret
	.size	window_render, .-window_render
	.globl	window_renderAll
	.type	window_renderAll, @function
window_renderAll:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$24, %esp
	movl	allWindows, %eax
	movl	%eax, -12(%ebp)
	cmpl	$0, -12(%ebp)
	jne	.L385
	call	taskbar_render
	call	gfx_db_swap
	jmp	.L382
.L386:
	movl	-12(%ebp), %eax
	movl	(%eax), %eax
	subl	$12, %esp
	pushl	%eax
	call	window_render
	addl	$16, %esp
	movl	-12(%ebp), %eax
	movl	4(%eax), %eax
	movl	%eax, -12(%ebp)
.L385:
	movl	-12(%ebp), %eax
	movl	4(%eax), %eax
	testl	%eax, %eax
	jne	.L386
	call	taskbar_render
	movl	-12(%ebp), %eax
	movl	(%eax), %eax
	subl	$12, %esp
	pushl	%eax
	call	window_render
	addl	$16, %esp
	call	gfx_db_swap
.L382:
	leave
	ret
	.size	window_renderAll, .-window_renderAll
	.globl	window_create
	.type	window_create, @function
window_create:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$64, %esp
	pushl	$44
	call	malloc
	addl	$4, %esp
	movl	%eax, -16(%ebp)
	leal	-32(%ebp), %eax
	pushl	$44725
	pushl	%eax
	call	gfx_init_ctx_rgb_rtrn
	addl	$4, %esp
	movl	-16(%ebp), %eax
	movl	%eax, %ebx
	movl	$11, %edx
	movl	$0, %eax
	movl	%ebx, %edi
	movl	%edx, %ecx
	rep stosl
	movl	-16(%ebp), %eax
	movl	8(%ebp), %edx
	movl	%edx, (%eax)
	movl	-16(%ebp), %eax
	movl	12(%ebp), %edx
	movl	%edx, 4(%eax)
	movl	-16(%ebp), %eax
	movl	16(%ebp), %edx
	movl	%edx, 8(%eax)
	movl	-16(%ebp), %eax
	movl	20(%ebp), %edx
	movl	%edx, 12(%eax)
	movl	-16(%ebp), %eax
	movl	24(%ebp), %edx
	movl	%edx, 16(%eax)
	movl	-16(%ebp), %eax
	movl	28(%ebp), %edx
	movl	%edx, 20(%eax)
	movl	-16(%ebp), %eax
	leal	28(%eax), %ebx
	leal	-32(%ebp), %eax
	movl	$4, %edx
	movl	%ebx, %edi
	movl	%eax, %esi
	movl	%edx, %ecx
	rep movsl
	pushl	-16(%ebp)
	pushl	$allWindows
	call	linked_add
	addl	$8, %esp
	movl	-16(%ebp), %eax
	leal	-12(%ebp), %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	popl	%ebp
	ret
	.size	window_create, .-window_create
	.globl	window_checkMove
	.type	window_checkMove, @function
window_checkMove:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%esi
	pushl	%ebx
	movl	$MOUSE_FONT_REG, gfx_mouse_current_glpyh
	movb	windowIsSelected, %al
	testb	%al, %al
	je	.L394
	movl	wasClicked+48, %edx
	movl	8(%ebp), %eax
	cmpl	%eax, %edx
	jne	.L391
	movl	wasClicked+52, %edx
	movl	12(%ebp), %eax
	cmpl	%eax, %edx
	je	.L392
.L391:
	movw	desktop_background_color, %ax
	movzwl	%ax, %eax
	movl	wasClicked, %edx
	movl	12(%edx), %edx
	addl	$20, %edx
	movl	%edx, %esi
	movl	wasClicked, %edx
	movl	8(%edx), %edx
	movl	%edx, %ebx
	movl	wasClicked, %edx
	movl	4(%edx), %edx
	movl	%edx, %ecx
	movl	wasClicked, %edx
	movl	(%edx), %edx
	pushl	%eax
	pushl	%esi
	pushl	%ebx
	pushl	%ecx
	pushl	%edx
	call	gfx_fillRect_col
	addl	$20, %esp
	movl	wasClicked+56, %eax
	testl	%eax, %eax
	jne	.L393
	movl	wasClicked+4, %edx
	movl	8(%ebp), %ecx
	movl	wasClicked+48, %eax
	subl	%eax, %ecx
	movl	wasClicked, %eax
	addl	%ecx, %edx
	movl	%edx, (%eax)
	movl	wasClicked+8, %edx
	movl	12(%ebp), %ecx
	movl	wasClicked+52, %eax
	subl	%eax, %ecx
	movl	wasClicked, %eax
	addl	%ecx, %edx
	movl	%edx, 4(%eax)
	jmp	.L392
.L393:
	movl	wasClicked+60, %eax
	testl	%eax, %eax
	je	.L392
	movl	$MOUSE_FONT_SIZE, gfx_mouse_current_glpyh
	movl	wasClicked+12, %edx
	movl	8(%ebp), %ecx
	movl	wasClicked+48, %eax
	subl	%eax, %ecx
	movl	wasClicked, %eax
	addl	%ecx, %edx
	movl	%edx, 8(%eax)
	movl	wasClicked+16, %edx
	movl	12(%ebp), %ecx
	movl	wasClicked+52, %eax
	subl	%eax, %ecx
	movl	wasClicked, %eax
	addl	%ecx, %edx
	movl	%edx, 12(%eax)
.L392:
	call	window_renderAll
.L394:
	nop
	leal	-8(%ebp), %esp
	popl	%ebx
	popl	%esi
	popl	%ebp
	ret
	.size	window_checkMove, .-window_checkMove
	.globl	window_checkClick
	.type	window_checkClick, @function
window_checkClick:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$140, %esp
	movl	16(%ebp), %eax
	movb	%al, -124(%ebp)
	cmpb	$1, -124(%ebp)
	jne	.L396
	movl	allWindows, %eax
	movl	%eax, -28(%ebp)
	movl	$-1, -32(%ebp)
	movl	$0, -36(%ebp)
	jmp	.L397
.L400:
	movl	-28(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, -40(%ebp)
	movl	-40(%ebp), %eax
	movl	(%eax), %edx
	movl	8(%ebp), %eax
	cmpl	%eax, %edx
	ja	.L398
	movl	-40(%ebp), %eax
	movl	4(%eax), %edx
	movl	12(%ebp), %eax
	cmpl	%eax, %edx
	ja	.L398
	movl	-40(%ebp), %eax
	movl	(%eax), %edx
	movl	-40(%ebp), %eax
	movl	8(%eax), %eax
	addl	%eax, %edx
	movl	8(%ebp), %eax
	cmpl	%eax, %edx
	jb	.L398
	movl	-40(%ebp), %eax
	movl	4(%eax), %edx
	movl	-40(%ebp), %eax
	movl	12(%eax), %eax
	addl	%edx, %eax
	leal	20(%eax), %edx
	movl	12(%ebp), %eax
	cmpl	%eax, %edx
	jb	.L398
	movl	-36(%ebp), %eax
	movl	%eax, -32(%ebp)
	movl	-40(%ebp), %eax
	movl	4(%eax), %eax
	leal	20(%eax), %edx
	movl	12(%ebp), %eax
	cmpl	%eax, %edx
	jb	.L398
	movl	-40(%ebp), %eax
	movl	(%eax), %edx
	movl	-40(%ebp), %eax
	movl	8(%eax), %eax
	addl	%edx, %eax
	leal	-60(%eax), %edx
	movl	8(%ebp), %eax
	cmpl	%eax, %edx
	jnb	.L398
	movb	$0, windowIsSelected
	movw	desktop_background_color, %ax
	movzwl	%ax, %eax
	movl	-40(%ebp), %edx
	movl	12(%edx), %edx
	addl	$20, %edx
	movl	%edx, %esi
	movl	-40(%ebp), %edx
	movl	8(%edx), %edx
	movl	%edx, %ebx
	movl	-40(%ebp), %edx
	movl	4(%edx), %edx
	movl	%edx, %ecx
	movl	-40(%ebp), %edx
	movl	(%edx), %edx
	pushl	%eax
	pushl	%esi
	pushl	%ebx
	pushl	%ecx
	pushl	%edx
	call	gfx_fillRect_col
	addl	$20, %esp
	pushl	-32(%ebp)
	pushl	$allWindows
	call	linked_remove
	addl	$8, %esp
	call	window_renderAll
	jmp	.L395
.L398:
	movl	-28(%ebp), %eax
	movl	4(%eax), %eax
	movl	%eax, -28(%ebp)
	incl	-36(%ebp)
.L397:
	cmpl	$0, -28(%ebp)
	jne	.L400
	cmpl	$-1, -32(%ebp)
	je	.L401
	movl	-36(%ebp), %eax
	decl	%eax
	cmpl	%eax, -32(%ebp)
	je	.L402
	subl	$8, %esp
	pushl	-32(%ebp)
	pushl	$allWindows
	call	linked_moveToEnd
	addl	$16, %esp
.L402:
	movl	allWindows, %eax
	subl	$8, %esp
	pushl	$-1
	pushl	%eax
	call	linked_read_link
	addl	$16, %esp
	movl	(%eax), %eax
	movl	%eax, -40(%ebp)
	movl	8(%ebp), %eax
	movl	%eax, -128(%ebp)
	movl	12(%ebp), %eax
	movl	%eax, -132(%ebp)
	movl	-40(%ebp), %eax
	movl	4(%eax), %eax
	leal	20(%eax), %edx
	movl	12(%ebp), %eax
	cmpl	%eax, %edx
	setb	%al
	movzbl	%al, %eax
	movl	%eax, -136(%ebp)
	movl	-40(%ebp), %eax
	movl	(%eax), %edx
	movl	-40(%ebp), %eax
	movl	8(%eax), %eax
	addl	%edx, %eax
	leal	-10(%eax), %edx
	movl	8(%ebp), %eax
	cmpl	%eax, %edx
	jnb	.L403
	movl	-40(%ebp), %eax
	movl	4(%eax), %edx
	movl	-40(%ebp), %eax
	movl	12(%eax), %eax
	addl	%edx, %eax
	leal	10(%eax), %edx
	movl	12(%ebp), %eax
	cmpl	%eax, %edx
	jnb	.L403
	movl	$1, %eax
	jmp	.L404
.L403:
	movl	$0, %eax
.L404:
	movl	%eax, -140(%ebp)
	movl	-40(%ebp), %eax
	movl	%eax, wasClicked
	movl	-40(%ebp), %eax
	movl	$wasClicked+4, %edx
	movl	%eax, %ebx
	movl	$11, %eax
	movl	%edx, %edi
	movl	%ebx, %esi
	movl	%eax, %ecx
	rep movsl
	movl	-128(%ebp), %edi
	movl	%edi, wasClicked+48
	movl	-132(%ebp), %ebx
	movl	%ebx, wasClicked+52
	movl	-136(%ebp), %esi
	movl	%esi, wasClicked+56
	movl	-140(%ebp), %eax
	movl	%eax, wasClicked+60
	movb	$1, windowIsSelected
	movl	-36(%ebp), %eax
	decl	%eax
	cmpl	%eax, -32(%ebp)
	jne	.L405
	movl	wasClicked+56, %eax
	testl	%eax, %eax
	je	.L405
	movl	-40(%ebp), %eax
	movl	20(%eax), %eax
	testl	%eax, %eax
	je	.L405
	movl	8(%ebp), %ecx
	movl	-40(%ebp), %eax
	movl	(%eax), %edx
	movl	%ecx, %eax
	subl	%edx, %eax
	movl	%eax, -56(%ebp)
	movl	12(%ebp), %ecx
	movl	-40(%ebp), %eax
	movl	4(%eax), %edx
	movl	%ecx, %eax
	subl	%edx, %eax
	movl	%eax, -52(%ebp)
	movl	-40(%ebp), %eax
	movl	%eax, -48(%ebp)
	movl	$1, -44(%ebp)
	movl	-40(%ebp), %eax
	movl	20(%eax), %eax
	movl	%eax, %edx
	subl	$12, %esp
	leal	-56(%ebp), %eax
	pushl	%eax
	call	*%edx
	addl	$16, %esp
.L405:
	call	window_renderAll
	jmp	.L395
.L401:
	movb	$0, windowIsSelected
	jmp	.L395
.L396:
	movb	$0, windowIsSelected
.L395:
	leal	-12(%ebp), %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	popl	%ebp
	ret
	.size	window_checkClick, .-window_checkClick
	.globl	counter_string
	.section	.bss
	.align 4
	.type	counter_string, @object
	.size	counter_string, 4
counter_string:
	.zero	4
	.globl	counter
	.align 4
	.type	counter, @object
	.size	counter, 4
counter:
	.zero	4
	.globl	text1
	.align 4
	.type	text1, @object
	.size	text1, 4
text1:
	.zero	4
	.globl	text2
	.align 4
	.type	text2, @object
	.size	text2, 4
text2:
	.zero	4
	.globl	window1
	.align 4
	.type	window1, @object
	.size	window1, 4
window1:
	.zero	4
	.globl	window2
	.align 4
	.type	window2, @object
	.size	window2, 4
window2:
	.zero	4
	.text
	.globl	test_windowEvent
	.type	test_windowEvent, @function
test_windowEvent:
	pushl	%ebp
	movl	%esp, %ebp
	movl	8(%ebp), %eax
	movl	12(%eax), %eax
	cmpl	$1, %eax
	jne	.L408
	movl	counter_string, %edx
	movl	counter, %eax
	pushl	%edx
	pushl	%eax
	call	itoa
	addl	$8, %esp
	movl	counter, %eax
	incl	%eax
	movl	%eax, counter
.L408:
	nop
	leave
	ret
	.size	test_windowEvent, .-test_windowEvent
	.section	.rodata
.LC27:
	.string	"Window 1"
.LC28:
	.string	"Window 2"
	.text
	.globl	desktop_example
	.type	desktop_example, @function
desktop_example:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	$10
	call	malloc
	addl	$4, %esp
	movl	%eax, counter_string
	movl	counter_string, %eax
	pushl	%eax
	pushl	$0
	call	itoa
	addl	$8, %esp
	movl	counter_string, %eax
	pushl	$GFX_DEFAULT_BLACK
	pushl	%eax
	call	widget_text_create
	addl	$8, %esp
	movl	%eax, text1
	movl	counter_string, %eax
	pushl	$GFX_DEFAULT_BLACK
	pushl	%eax
	call	widget_text_create
	addl	$8, %esp
	movl	%eax, text2
	pushl	$test_windowEvent
	pushl	$.LC27
	pushl	$100
	pushl	$200
	pushl	$50
	pushl	$50
	call	window_create
	addl	$24, %esp
	movl	%eax, window1
	movl	text1, %edx
	movl	window1, %eax
	pushl	$15
	pushl	$15
	pushl	%edx
	pushl	$0
	pushl	%eax
	call	widget_append
	addl	$20, %esp
	movl	text2, %edx
	movl	window1, %eax
	pushl	$70
	pushl	$170
	pushl	%edx
	pushl	$0
	pushl	%eax
	call	widget_append
	addl	$20, %esp
	pushl	$0
	pushl	$.LC28
	pushl	$100
	pushl	$200
	pushl	$100
	pushl	$100
	call	window_create
	addl	$24, %esp
	movl	%eax, window2
	nop
	leave
	ret
	.size	desktop_example, .-desktop_example
	.globl	desktop_load
	.type	desktop_load, @function
desktop_load:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$8, %esp
	pushl	$31
	pushl	$63
	pushl	$31
	pushl	$gfx_current_ctx
	call	gfx_init_ctx
	addl	$16, %esp
	pushl	$tty_current_ctx
	pushl	$gfx_current_ctx
	pushl	$65
	pushl	$0
	pushl	$0
	call	tty_init_ctx
	addl	$20, %esp
	call	desktop_example
	call	gfx_db_begin
	movw	desktop_background_color, %ax
	movzwl	%ax, %eax
	pushl	%eax
	pushl	$480
	pushl	$640
	pushl	$0
	pushl	$0
	call	gfx_fillRect_col
	addl	$20, %esp
	pushl	$window_checkClick
	call	mouse_onClick
	addl	$4, %esp
	pushl	$window_checkMove
	call	mouse_onMove
	addl	$4, %esp
	call	window_renderAll
	nop
	leave
	ret
	.size	desktop_load, .-desktop_load
	.section	.rodata
.LC29:
	.string	"==Finishing boot==\n"
.LC30:
	.string	"... Mouse installed\n"
.LC31:
	.string	"... Interrupts ready\n"
.LC32:
	.string	"... Interrupts active\n"
.LC33:
	.string	"... Syscalls enabled\n"
	.align 4
.LC34:
	.string	"==== Hit any key to load desktop ====\n"
	.text
	.globl	kern_postBootSequence
	.type	kern_postBootSequence, @function
kern_postBootSequence:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	$0
	pushl	$63
	pushl	$0
	pushl	$gfx_current_ctx
	call	gfx_init_ctx
	addl	$16, %esp
	pushl	$tty_current_ctx
	pushl	$gfx_current_ctx
	pushl	$65
	pushl	$0
	pushl	$0
	call	tty_init_ctx
	addl	$20, %esp
	pushl	$.LC29
	call	tty_putString
	addl	$4, %esp
	call	mouse_init
	movl	$MOUSE_FONT_REG, gfx_mouse_current_glpyh
	pushl	$.LC30
	call	tty_putString
	addl	$4, %esp
	pushl	$200
	call	timer_init
	addl	$4, %esp
	call	idt_load_stubs
	pushl	$keyboard_handler
	pushl	$1
	call	idt_load_interrupt
	addl	$8, %esp
	pushl	$timer_callback
	pushl	$0
	call	idt_load_interrupt
	addl	$8, %esp
	pushl	$mouse_handler
	pushl	$12
	call	idt_load_interrupt
	addl	$8, %esp
	pushl	$.LC31
	call	tty_putString
	addl	$4, %esp
	call	pic_remap
	pushl	$1
	call	pic_enable_irq
	addl	$4, %esp
	pushl	$2
	call	pic_enable_irq
	addl	$4, %esp
	pushl	$12
	call	pic_enable_irq
	addl	$4, %esp
	call	enable_interrupts
	pushl	$.LC32
	call	tty_putString
	addl	$4, %esp
	call	syscalls_init
	pushl	$.LC33
	call	tty_putString
	addl	$4, %esp
	pushl	$.LC34
	call	tty_putString
	addl	$4, %esp
	pushl	$0
	pushl	$0
	call	mouse_render
	addl	$8, %esp
	nop
	leave
	ret
	.size	kern_postBootSequence, .-kern_postBootSequence
	.section	.rodata
.LC35:
	.string	"TEST1\n"
.LC36:
	.string	"TEST2\n"
.LC37:
	.string	"TEST3\n"
.LC38:
	.string	"TEST4\n"
	.text
	.globl	kernel_entry
	.type	kernel_entry, @function
kernel_entry:
	pushl	%ebp
	movl	%esp, %ebp
	call	kern_postBootSequence
	pushl	$.LC35
	call	tty_putString
	addl	$4, %esp
	pushl	$.LC36
	call	tty_putString
	addl	$4, %esp
	pushl	$.LC37
	call	tty_putString
	addl	$4, %esp
	pushl	$.LC38
	call	tty_putString
	addl	$4, %esp
	pushl	$gfx_current_ctx
	pushl	$200
	pushl	$200
	pushl	$200
	pushl	$150
	call	gfx_fillRect
	addl	$20, %esp
	call	getch
	call	run_disk_test
	nop
	leave
	ret
	.size	kernel_entry, .-kernel_entry
	.local	return_struct.4
	.comm	return_struct.4,28,4
	.local	outputName16.3
	.comm	outputName16.3,64,32
	.local	outputName8.2
	.comm	outputName8.2,64,32
	.local	file.1
	.comm	file.1,4,4
	.local	fsectBuff.0
	.comm	fsectBuff.0,512,32
	.ident	"GCC: (GNU) 11.2.0"
