#!/bin/bash

mkdir -p sdcard
sudo dd if=/dev/zero of=rootfs.ext3 bs=1M count=50
sudo mkfs.ext3 rootfs.ext3
sudo mount -t ext3 rootfs.ext3 sdcard -o loop
sudo cp _install/* sdcard/ -fra
sudo umount sdcard/
sudo chmod 666 rootfs.ext3

