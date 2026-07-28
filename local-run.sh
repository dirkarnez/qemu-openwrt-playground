#!/bin/bash

echo "User: $(whoami) UID: $(id -u) GID: $(id -g)"

qemu-system-aarch64 -m 1024 -smp 2 -cpu cortex-a57 -M virt -nographic \
-kernel openwrt-19.07.3-armvirt-64-Image-initramfs \
-drive if=none,file=disk.img,id=hd0 -device virtio-blk-device,drive=hd0
