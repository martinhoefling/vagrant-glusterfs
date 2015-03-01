#!/bin/bash -ux

apt-get install -y xfsprogs
parted /dev/sdb mklabel msdos
parted /dev/sdb mkpart primary 512 100%
mkfs.xfs /dev/sdb1
mkdir /storage
echo `blkid /dev/sdb1 | awk '{print$2}' | sed -e 's/"//g'` /storage   xfs   noatime,nobarrier   0   0 >> /etc/fstab
mount /storage

sudo add-apt-repository ppa:semiosis/ubuntu-glusterfs-3.5
sudo apt-get update
sudo apt-get install -y glusterfs-server

for i in 1 2 3; do
  if [ "gluster${i}" != "$HOSTNAME" ]; then
    echo 192.168.1.10${i} gluster${i} >> /etc/hosts
  fi
done
