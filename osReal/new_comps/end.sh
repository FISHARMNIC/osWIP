echo "********************UNMOUNTING********************"

losetup_output=$(limactl shell debian sudo losetup -a)
recent_devices=$(echo "$losetup_output" | awk '{sub(/:$/, "", $1); print $1}' | sort -V | tail -n 2)
loop_device1=$(echo "$recent_devices" | head -n 1)
loop_device2=$(echo "$recent_devices" | tail -n 1)

limactl shell debian sudo umount /mnt

echo "********************REMOVING LOOPBACKS********************"
limactl shell debian sudo losetup -d "$loop_device1"
limactl shell debian sudo losetup -d "$loop_device2"