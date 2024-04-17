# SOMETHING HAPPENING WITH DD
echo "********************COMPILING********************"

set -e
./comp2.sh

limactl shell debian sudo cp bin/compiled/MyOS.bin /mnt/boot/MyOS.bin
limactl shell debian sudo cp bin/isodir/boot/grub/grub.cfg /mnt/boot/grub/grub.cfg
limactl shell debian sudo mkdir -p /mnt/test
limactl shell debian sudo mkdir -p /mnt/test/test2

limactl shell debian sudo cp bin/test/hello.txt /mnt/test/hello.txt
limactl shell debian sudo cp bin/test/hello.txt /mnt/test/test2/hello2.txt
limactl shell debian sudo cp apps/printHello /mnt/test/test2/printHello
limactl shell debian sudo cp ppm2raw/chicken /mnt/test/test2/chickenimg

echo "**********************FS***********************"
limactl shell debian sudo ls /mnt
echo "********************RUNNING********************"

# need to write "load_env" then "normal" for some reason
qemu-system-i386 -machine pc -drive file=bin/compiled/disk.img,format=raw