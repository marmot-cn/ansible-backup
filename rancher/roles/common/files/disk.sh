#!/bin/bash

DISK=$1

CHECK_EXIST=`fdisk -l 2> /dev/null | grep -o "$DISK"`
[ ! "$CHECK_EXIST" ] && { echo "Error: Disk is not found !"; exit 1;}

CHECK_DISK_EXIST=`fdisk -l 2> /dev/null | grep -o "$DISK[1-9]"`
[ ! "$CHECK_DISK_EXIST" ] || { echo "WARNING: ${CHECK_DISK_EXIST} is Partition already !"; exit 0;}

fdisk $DISK<<EOF  
n
p
1
 

wq
EOF	