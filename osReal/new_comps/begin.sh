echo "********************COPYING DISK********************"

# rm bin/compiled/disk.img


dd if=/dev/zero of=bin/compiled/disk.img bs=512 count=131072

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

#i386-elf-ld bin/compiled/kernel.o bin/compiled/boot.o -o bin/compiled/MyOS.bin -nostdlib

