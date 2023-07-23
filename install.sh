#!/usr/bin/bash

echo "This is a Script Written by PranavVerma-droid"
echo "This Script has been Written for the InfinityX OS"
echo "This Script Only Works on the Ubuntu/Raspbian Platform!"

echo ""
echo "Installing Dependencies...."
echo ""

sudo apt-get update -y
sudo apt-get upgrade -y


sudo apt install build-essential bison flex libgmp3-dev libmpc-dev libmpfr-dev texinfo wget \
                   nasm mtools python3 python3-pip python3-parted scons dosfstools libguestfs-tools qemu-system-x86

sudo apt-get install linux-image-generic



python3 -m pip install -r requirements.txt
echo ""
echo "Where is the Local Path of THIS Folder? (ex: /home/user/Github/InfinityX-OS)"
read LOCALPATH

cd /
<<<<<<< HEAD
sudo mkdir toolchains
cd ${LOCALPATH}
=======
sudo mkdir toolchains-InfinityX
cd {LOCALPATH}
>>>>>>> 7940adc0c03bcbaf5060157d1112e3f4d8debb8a

chmod +x scripts/setup_toolchain.sh
chmod +x scripts/run.sh

scons toolchain

echo ""
echo "Done! Installed All Dependencies & Toolchains!"
echo ""
echo "Now You can Make the OS! Run scons run"
echo ""



