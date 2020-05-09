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
        -smp 2 \
        -m 1024M \
        -kernel ${KERNEL_IMAGE_DIR}/bzImage \
        -nographic \
        -append "rdinit=/linuxrc console=ttyS0" \
        -initrd ./initramfs.cpio.gz
