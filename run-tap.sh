#!/bin/bash

if [ x${KERNEL_IMAGE_DIR} = x ];then
	KERNEL_IMAGE_DIR=./image
fi

if [ $# == 1 ];then
	KERNEL_IMAGE_DIR=$1

fi

echo "using kernel image: ${KERNEL_IMAGE_DIR}/bzImage"

if [ ! -f ${KERNEL_IMAGE_DIR}/bzImage ];then
	echo "kernel image not exist!!!"
	exit 1;
fi

qemu-system-x86_64 \
        -smp 4 \
        -m 4096M \
        -kernel ${KERNEL_IMAGE_DIR}/bzImage \
        -nographic \
        -append "rdinit=/linuxrc console=ttyS0" \
        -initrd ./initramfs.cpio.gz \
        -netdev tap,id=tap1,ifname=tap1,script=no \
        -device e1000,netdev=tap1
