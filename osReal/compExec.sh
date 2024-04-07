i386-elf-gcc -ffreestanding -Wall -c apps/printHello.c -o apps/printHello.o -nostdlib -nostartfiles
i386-elf-ld apps/printHello.o -o apps/printHello