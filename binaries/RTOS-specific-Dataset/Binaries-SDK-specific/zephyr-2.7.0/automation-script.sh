#!/bin/bash

set -x
set -e

# Defining the source directory to copy the automation script files and the destination CVE folder
export DATABASE_HOME=/home/sidharth/dataset-creation/zephyr-binaries

# Version of Zephyr required for this CVE
export ZEPHYR_VER=2.7.0
export ZEPHYR_SDK_VER=0.13.1
export SDK_LINK=https://github.com/zephyrproject-rtos/sdk-ng/releases/download/v0.13.1/zephyr-sdk-0.13.1-linux-x86_64-setup.run

if [ ! -e ~/zephyr-sdk-$ZEPHYR_SDK_VER ]; then
    cd ~/
    wget $SDK_LINK
    chmod +x zephyr-sdk-$ZEPHYR_SDK_VER-linux-x86_64-setup.run
    ./zephyr-sdk-$ZEPHYR_SDK_VER-linux-x86_64-setup.run -- -d ~/zephyr-sdk-$ZEPHYR_SDK_VER
    sudo cp ~/zephyr-sdk-$ZEPHYR_SDK_VER/sysroots/x86_64-pokysdk-linux/usr/share/openocd/contrib/60-openocd.rules /etc/udev/rules.d
    sudo udevadm control --reload
fi

# Creating the required directories
mkdir $DATABASE_HOME/zephyr-$ZEPHYR_VER/ARC-Boards
mkdir $DATABASE_HOME/zephyr-$ZEPHYR_VER/ARM-Boards
mkdir $DATABASE_HOME/zephyr-$ZEPHYR_VER/RISCV-Boards
mkdir $DATABASE_HOME/zephyr-$ZEPHYR_VER/X86-Boards

# Copying the automation scripts from the souce or reference directory
cp /home/sidharth/dataset-creation/Shell-scripts-SDK-specific/ARC.sh $DATABASE_HOME/zephyr-$ZEPHYR_VER/ARC-Boards/ARC-zephyr-$ZEPHYR_VER.sh
cp /home/sidharth/dataset-creation/Shell-scripts-SDK-specific/ARM.sh $DATABASE_HOME/zephyr-$ZEPHYR_VER/ARM-Boards/ARM-zephyr-$ZEPHYR_VER.sh
cp /home/sidharth/dataset-creation/Shell-scripts-SDK-specific/RISCV.sh $DATABASE_HOME/zephyr-$ZEPHYR_VER/RISCV-Boards/RISCV-zephyr-$ZEPHYR_VER.sh
cp /home/sidharth/dataset-creation/Shell-scripts-SDK-specific/X86.sh $DATABASE_HOME/zephyr-$ZEPHYR_VER/X86-Boards/X86-zephyr-$ZEPHYR_VER.sh
cp /home/sidharth/dataset-creation/Shell-scripts-SDK-specific/SDK-build.sh $DATABASE_HOME/zephyr-$ZEPHYR_VER/zephyr-$ZEPHYR_VER-build.sh

# Running all the automation scripts
"$DATABASE_HOME/zephyr-$ZEPHYR_VER/ARC-Boards/ARC-zephyr-$ZEPHYR_VER.sh" 
"$DATABASE_HOME/zephyr-$ZEPHYR_VER/ARM-Boards/ARM-zephyr-$ZEPHYR_VER.sh"
"$DATABASE_HOME/zephyr-$ZEPHYR_VER/RISCV-Boards/RISCV-zephyr-$ZEPHYR_VER.sh"
"$DATABASE_HOME/zephyr-$ZEPHYR_VER/X86-Boards/X86-zephyr-$ZEPHYR_VER.sh"