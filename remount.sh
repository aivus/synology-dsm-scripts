#!/bin/sh
# This script allows to remount USB disk to the DSM
#
# Repository: https://github.com/aivus/synology-dsm-scripts
# Tested on the next DSM version range:
#  6.1.3-15152 Update 8 
#  6.2.4-25556
#
# Usage:
# ./remount.sh 1-3 /volumeUSB1/usbshare1-2

# Device from /sys/bus/usb/devices/* represent USB device.
# Check /sys/bus/usb/devices/*/product to find correct USB disk
device=$1
volume=$2

if [ ! -d ${volume} ]; then
    echo "Directory ${volume} does not exist. Remount HDD";
    echo 0 >  /sys/bus/usb/devices/${device}/authorized;
    sleep 1;
    echo 1 >  /sys/bus/usb/devices/${device}/authorized;
else
    echo "Directory ${volume} exists. No need to remount HDD, Skipping...";
fi
