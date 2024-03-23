echo 1
#assemble boot.s file
i386-elf-gcc -ffreestanding -c boot/boot.s -o bin/compiled/boot.o

echo 2
#compile kernel.c file
if (i386-elf-gcc -ffreestanding -Wall -c kernel/main.c -o bin/compiled/kernel.o) ; then
    echo 3
    #linking the kernel with kernel.o and boot.o files
    if (limactl shell debian ld -m elf_i386 -T boot/linker.ld bin/compiled/kernel.o bin/compiled/boot.o -o bin/compiled/MyOS.bin -nostdlib) ; then
        echo 4
        #check MyOS.bin file is x86 multiboot file or not
        limactl shell debian grub-file --is-x86-multiboot bin/compiled/MyOS.bin

        #building the iso file
        mkdir -p bin/isodir/boot/grub
        cp bin/compiled/MyOS.bin bin/isodir/boot/MyOS.bin
        cp boot/grub_new.cfg bin/isodir/boot/grub/grub.cfg
        cp boot/menu.lst bin/isodir/boot/grub/menu.lst
        limactl shell debian grub-mkrescue -o bin/compiled/MyOS.iso bin/isodir

        exit
    fi
fi