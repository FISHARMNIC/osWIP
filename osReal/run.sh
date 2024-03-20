limactl shell debian ./comp.sh
qemu-system-i386 -machine pc -hda bin/compiled/MyOS.iso -d int -accel tcg
