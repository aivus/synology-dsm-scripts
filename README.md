# Synology DSM scripts
Some useful scripts for Synology DSM

Next scripts should be placed to the body of user-defined script in Task Scheduler.


## Eject USB disk from the DSM using eject.sh

Note: Replace `sdq` in this script to the proper name of your disk

Trigger script:
```bash
#!/bin/bash

# Sleep to be sure that disk mounted properly after boot-up
sleep 60;

# Download script if it doesn't exist
if [ ! -f /root/eject.sh ]; then
    curl https://raw.githubusercontent.com/aivus/synology-dsm-scripts/master/eject.sh --output /root/eject.sh
    chmod +x /root/eject.sh
fi

# Eject sdq disk
/root/eject.sh sdq
```


## Remount USB disk to the DSM after it was ejected

Note: Replace `1-3` and `/volumeUSB2/usbshare2-2` in the `remount.sh` script call to the proper values of your disk.

Where:
* `1-3` is a USB device identifier which could be found in `/sys/bus/usb/devices/` directory by checking content of the `/sys/bus/usb/devices/*/product` file.
* `/volumeUSB2/usbshare2-2` is a path where the USB disk should be mounted (is used to verify that mount was successful)


To found device identifier:
```
sh-4.3# ls -l /sys/bus/usb/devices/ | grep 1-3
lrwxrwxrwx 1 root root 0 Apr  7 04:38 1-3 -> ../../../devices/pci0000:00/0000:00:14.0/usb1/1-3
lrwxrwxrwx 1 root root 0 Apr  7 04:38 1-3:1.0 -> ../../../devices/pci0000:00/0000:00:14.0/usb1/1-3/1-3:1.0
sh-4.3# cat /sys/bus/usb/devices/1-3/product
Silicon-Power
```

Trigger script:

```bash
#!/bin/bash

# Download script if it doesn't exist
if [ ! -f /root/remount.sh ]; then
    curl https://raw.githubusercontent.com/aivus/synology-dsm-scripts/master/remount.sh --output /root/remount.sh
    chmod +x /root/remount.sh
fi

/root/remount.sh 1-3 /volumeUSB2/usbshare2-2
```
