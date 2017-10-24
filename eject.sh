#!/bin/sh
# This script allows to eject USB disk from the DSM
# Usage:
# ./eject.sh sdq
# Tested on DSM 6.1.3-15152 Update 8

# disk="sdq";
disk=$1;

if [ ! -e  "/dev/${disk}" ] ; then
    echo "Disk /dev/${disk} not found. Exiting.";
    exit 1;
fi

# Sleep to be sure that disk mounted properly after boot-up
# sleep 60;

# Sync writes
sync;
# Unmount sdq disks (all partitions)
/usr/syno/bin/synousbdisk -umount ${disk};
# Safe sleep
sleep 5;
# Remove disk from the usbtab file to remove it from the DSM
echo 1 > /sys/block/sdq/device/delete
