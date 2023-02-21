#!/bin/bash

set -x
set -e

#CVE for which binaries are generated
export ZEPHYR_VERSION=$ZEPHYR_VER
export ZEPHYR_SDK_VERSION=$ZEPHYR_SDK_VER

if [ ! -e ~/zephyr-$ZEPHYR_VERSION ]; then
	cd ~/
	mkdir zephyr-$ZEPHYR_VERSION
fi

export ZEPHYR_HOME=~/zephyr-$ZEPHYR_VERSION
export SAMPLE_HOME=$ZEPHYR_HOME/zephyr/samples

# Directories configuration    
export OUT_DIR=$DATABASE_HOME/zephyr-$ZEPHYR_VERSION/RISCV-Boards
export ARCH=RISCV

# Boards selected for binary generation
export BOARDS="hifive1 litex_vexriscv"
export BOARD_NAMES="SiFive-HiFive1 LiteX-VexRiscv"

export SAMPLE_DIR="$SAMPLE_HOME/bluetooth/central $SAMPLE_HOME/bluetooth/hci_pwr_ctrl $SAMPLE_HOME/bluetooth/hci_uart
					$SAMPLE_HOME/bluetooth/peripheral $SAMPLE_HOME/cpp_synchronization
					$SAMPLE_HOME/display/cfb $SAMPLE_HOME/display/lvgl 
					$SAMPLE_HOME/drivers/current_sensing $SAMPLE_HOME/drivers/flash_shell
					$SAMPLE_HOME/mpu/mpu_test $SAMPLE_HOME/net/dhcpv4_client
					$SAMPLE_HOME/net/vlan $SAMPLE_HOME/net/wifi $SAMPLE_HOME/net/wpan_serial
					$SAMPLE_HOME/sensor/sensor_shell
					$SAMPLE_HOME/subsys/console/echo $SAMPLE_HOME/subsys/console/getchar
					$SAMPLE_HOME/subsys/console/getline 
					$SAMPLE_HOME/synchronization $SAMPLE_HOME/testing/integration $SAMPLE_HOME/userspace/prod_consumer
					$SAMPLE_HOME/userspace/shared_mem $SAMPLE_HOME/video/capture $SAMPLE_HOME/video/tcpserversink"

#run the general CVE generation shell script
"$DATABASE_HOME/zephyr-$ZEPHYR_VER/zephyr-$ZEPHYR_VER-build.sh"