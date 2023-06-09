#!/usr/bin/bash

echo "This is a Script Written by PranavVerma-droid"
echo "This Script has been Written for the InfinityX OS"
echo "This Script Only Works on the Ubuntu Platform!"

echo ""
echo "Installing Dependencies...."
echo ""

sudo apt-get update -y
sudo apt-get upgrade -y


sudo apt install build-essential bison flex libgmp3-dev libmpc-dev libmpfr-dev texinfo wget \
                   nasm mtools python3 python3-pip python3-parted scons dosfstools libguestfs-tools qemu-system-x86

sudo apt-get install linux-image-generic



python3 -m pip install -r requirements.txt

cd /
sudo mkdir toolchains
cd ~/OS-Files/InfinityX

chmod +x scripts/setup_toolchain.sh
chmod +x scripts/run.sh

scons toolchain

echo ""
echo "Done! Installed All Dependencies!"
echo ""


echo "Now You can Make the OS! Run scons run"
echo ""



