echo 1
#assemble boot.s file
as --32 boot/boot.s -o bin/compiled/boot.o

echo 2
#compile kernel.c file
if (gcc -m32 -c kernel/main.c -o bin/compiled/kernel.o -ffreestanding -O3) ; then
    echo 3
    #linking the kernel with kernel.o and boot.o files
    if (ld -m elf_i386 -T boot/linker.ld bin/compiled/kernel.o bin/compiled/boot.o -o bin/compiled/MyOS.bin -nostdlib) ; then
        echo 4
        #check MyOS.bin file is x86 multiboot file or not
        grub-file --is-x86-multiboot bin/compiled/MyOS.bin

        #building the iso file
        mkdir -p bin/isodir/boot/grub
        cp bin/compiled/MyOS.bin bin/isodir/boot/MyOS.bin
        cp boot/grub_new.cfg bin/isodir/boot/grub/grub.cfg
        cp boot/menu.lst bin/isodir/boot/grub/menu.lst
        grub-mkrescue -o bin/compiled/MyOS.iso bin/isodir

        #run the qemu
        #qemu-system-x86_64 -machine pc -hda bin/compiled/MyOS.iso
        exit
    fi
fi