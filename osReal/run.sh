#limactl shell debian ./comp.sh
./comp2.sh
# iso uses https://wiki.osdev.org/ISO_9660 fs
qemu-system-i386 -machine pc -drive file=bin/compiled/MyOS.iso,index=0,media=disk,format=raw  # -d int -accel tcg

#limactl shell debian ./comp.sh
# ./comp2.sh
# qemu-system-i386 -machine pc -hda bin/compiled/MyOS.iso # -d int -accel tcg
