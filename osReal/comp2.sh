# rm -R bin/compiled/*
# rm -R bin/isodir/boot/*

echo 1
#assemble boot.s file
i386-elf-as boot/boot.s -o bin/compiled/boot.o

echo 2
#compile kernel.c file
if (i386-elf-gcc -ffreestanding -Wall -c kernel/main.c -o bin/compiled/kernel.o) ; then
    echo 3
    #linking the kernel with kernel.o and boot.o files -ffreestanding -O2 -nostdlib boot.o kernel.o -lgcc
    if (i386-elf-ld -T boot/linker.ld bin/compiled/kernel.o bin/compiled/boot.o -o bin/compiled/MyOS.bin -nostdlib) ; then
        echo 4
        #check MyOS.bin file is x86 multiboot file or not
        limactl shell debian grub-file --is-x86-multiboot bin/compiled/MyOS.bin

        #building the iso file
        mkdir -p bin/isodir/boot/grub
        cp bin/compiled/MyOS.bin bin/isodir/boot/MyOS.bin
        cp boot/grub.cfg bin/isodir/boot/grub/grub.cfg
        # limactl shell debian grub-mkrescue -o bin/compiled/MyOS.iso bin/isodir

        exit
    fi
fi