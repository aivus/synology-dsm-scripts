#!/bin/sh
# This script allows to eject USB disk from the DSM
#
# Repository: https://github.com/aivus/synology-dsm-scripts
# Tested on the next DSM version range:
#  6.1.3-15152 Update 8 
#  6.2.4-25556
#
# Usage:
# ./eject.sh sdq

set -e;

# disk="sdq";
disk=$1;

if [ ! -e  "/dev/${disk}" ] ; then
    echo "Disk /dev/${disk} not found. Exiting.";
    exit 1;
fi

# Sync writes
sync;
# Unmount sdq disks (all partitions)
/usr/syno/bin/synousbdisk -umount ${disk};
# Safe sleep
sleep 5;
# Remove disk from the usbtab file to remove it from the DSM
echo 1 > /sys/block/${disk}/device/delete;
