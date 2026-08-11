#!/bin/bash

export PATH="/usr/local/bin:/usr/bin:/bin:/mingw64/bin"
export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin" # linux
export PATH="$PATH:$(cygpath -u $USERPROFILE)/Downloads/qemu-w64-portable-20240822"

echo "User: $(whoami) UID: $(id -u) GID: $(id -g)"

qemu-system-aarch64 -m 1024 -smp 2 -cpu cortex-a57 -M virt -nographic \
    -kernel ../openwrt-19.07.3-armvirt-64-Image-initramfs

# \ -drive if=none,file=disk.img,id=hd0 -device virtio-blk-device,drive=hd0

# to enable networking
# -net nic,vlan=0 -net nic,vlan=1 -net user,vlan=1
# 網卡 1 (eth0)：連接到 vlan=0 → 孤立網路（無外網，無其他設備）。
# 網卡 2 (eth1)：連接到 vlan=1 → 連接 user 後端 → 可透過 NAT 訪問外網。

read -p "done"
