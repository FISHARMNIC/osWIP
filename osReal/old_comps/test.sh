disk_image="bin/compiled/disk.img"

dd if=/dev/zero of="$disk_image" count=163840 bs=512
fdisk -e "$disk_image" <<EOF
y
disk
n
edit 1
0B
n
2047

write
quit
EOF

dd if="$disk_image" of=bin/compiled/mbr.img bs=512 count=2047
dd if="$disk_image" of=bin/compiled/fs.img bs=512 skip=2047

device=$(hdiutil attach -nomount bin/compiled/fs.img)
device="$(echo $device | cut -d ' ' -f1)"
echo "DEVICE: $device"

newfs_msdos -F 32 "$device"
hdiutil detach "$device"

cat bin/compiled/mbr.img bin/compiled/fs.img > "$disk_image"

#hdiutil attach -noverify "$disk_image"

limactl shell debian sudo kpartx -av bin/compiled/disk.img
limactl shell debian sudo mount -o loop /dev/mapper/loop0p1 /mnt

#diskutil mountDisk "$device"
limactl shell debian sudo grub-install --root-directory=/mnt --target=i386-pc --no-floppy --modules="normal part_msdos ext2 multiboot biosdev" bin/compiled/fs.img