#!/bin/bash
#5. Write shell script to show various system configuration
#hey 2nd time
echo "OS Version, Release Number, Kernel: ";  uname -a
echo
echo "Available Shells: ";  cat /etc/shells
echo
echo "CPU Information: ";  lscpu
echo
echo "Memory Information: ";  free -m
echo
echo "Hard Disk Information: ";  lsblk
echo
echo "File System Information: "; mount
echo
