# SOMETHING HAPPENING WITH DD
echo "********************COMPILING********************"

set -e
./comp2.sh

echo "********************COPYING DISK********************"

rm bin/compiled/disk.img


dd if=/dev/zero of=bin/compiled/disk.img bs=512 count=131072
dd if=bin/compiled/kernel.o of=bin/compiled/disk.img bs=512 seek=0 conv=notrunc

limactl shell debian fdisk bin/compiled/disk.img <<EOF
n
p
1


a
w
EOF
echo "********************SETTING LOOPBACKS********************"
#limactl shell debian sudo rm -R /dev/loop3
limactl shell debian sudo losetup -fP bin/compiled/disk.img
limactl shell debian sudo losetup -fP bin/compiled/disk.img -o 1048576

losetup_output=$(limactl shell debian sudo losetup -a)
recent_devices=$(echo "$losetup_output" | awk '{sub(/:$/, "", $1); print $1}' | sort -V | tail -n 2)
loop_device1=$(echo "$recent_devices" | head -n 1)
loop_device2=$(echo "$recent_devices" | tail -n 1)

limactl shell debian sudo losetup -a

echo "Loop device 1: $loop_device1"
echo "Loop device 2: $loop_device2"

echo "********************CREATING FS********************"

limactl shell debian sudo mkdosfs -F32 -f 2 "$loop_device2"

echo "********************MOUTING AND INSTALLING********************"

limactl shell debian sudo mount "$loop_device2" /mnt
limactl shell debian sudo grub-install --target=i386-pc --root-directory=/mnt --no-floppy --modules="part_msdos biosdisk fat multiboot configfile" "$loop_device1"

echo "********************COPYING FILE SYSTEM********************"

limactl shell debian sudo cp bin/isodir/boot/myos.bin /mnt/boot/myos.bin
limactl shell debian sudo cp bin/isodir/boot/grub/grub.cfg /mnt/boot/grub/grub.cfg

echo "********************REMOVING LOOPBACKS********************"

limactl shell debian sudo umount /mnt
limactl shell debian sudo losetup -d "$loop_device1"
limactl shell debian sudo losetup -d "$loop_device2"

echo "********************LAUNCHING QEMU********************"

qemu-system-i386 -machine pc -drive file=bin/compiled/disk.img,format=raw