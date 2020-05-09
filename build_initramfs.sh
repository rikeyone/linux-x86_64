#!/bin/bash

# generate cpio initramfs
cd _install
find . | cpio -H newc -ov --owner root:root > ../initramfs.cpio
cd ../
gzip initramfs.cpio

