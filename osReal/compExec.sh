# for programs in the os itself

i386-elf-gcc -Wall -c apps/printHello.c -o apps/printHello.o -nostdlib -nostartfiles -fno-asynchronous-unwind-tables -ffreestanding 
i386-elf-ld -T apps/linker/link.ld apps/printHello.o -o apps/printHello -n