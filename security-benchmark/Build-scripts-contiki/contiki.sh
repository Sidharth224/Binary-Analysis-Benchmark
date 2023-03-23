#!/bin/bash

set -x
set -e

export CVENUM=2020-12140
export CONTIKI_VER=4.4
export CONTIKI_BASE_DIR=/home/sidharth/contiki-ng
export CONTIKI_EXAMPLE_DIR=$CONTIKI_BASE_DIR/examples
export PATCH_DIR=/home/sidharth/Binary-dataset-CVE-beta/security-benchmark/patches
export EXAMPLES="6tisch/sixtop 6tisch/6p-packet 6tisch/simple-node coap/coap-example-server dev/gpio-hal hello-world
                    libs/data-structures libs/stack-check libs/ipv6-hooks libs/deployment lwm2m-ipso-objects
                    mqtt-client multicast nullnet rpl-border-router rpl-udp sensniff slip-radio
                    snmp-server websocket"
export BOARDS="cc2538dk cc26x0-cc13x0 zoul simplelink openmote native"
export OUT_DIR=/home/sidharth/Binary-dataset-CVE-beta/security-benchmark

#Update git repo to required version
cd $CONTIKI_BASE_DIR
git reset --hard
git clean -df
git checkout release/v$CONTIKI_VER

#git apply $DIR/patches/cc2538_norom.patch

# Replace DMA-based read
#git apply $DIR/patches/cc2538_read.patch

# configure l2cap in hello-world sample
#git apply $DIR/patches/l2cap_sample.patch

# bugs in target identified after paper release, patch
git apply $PATCH_DIR/fix-l2cap-issues.patch

#git apply $DIR/patches/cc2538_norom.patch
# Replace DMA-based read
#git apply $DIR/patches/cc2538_read.patch

# Configure radio packet -> SNMP
#git apply $PATCH_DIR/transparent_mac.patch
#git apply $PATCH_DIR/snmp_sample.patch

mkdir $OUT_DIR/CVE-$CVENUM

for EXAMPLE in $EXAMPLES; do
    EXAMPLE_NAME="$(basename -- $EXAMPLE)"
    for BOARD in $BOARDS; do
        if [ -d $CONTIKI_EXAMPLE_DIR/$EXAMPLE ]; then

            #remove build before compiling
            if [ -d $CONTIKI_EXAMPLE_DIR/$EXAMPLE/build ]; then
                rm -r $CONTIKI_EXAMPLE_DIR/$EXAMPLE/build;
            fi

            cd $CONTIKI_EXAMPLE_DIR

            #if Target is zoul OR stm input the board name else usual compilation         
            if [[ "$BOARD" == "zoul" ]]; then
                make -C $CONTIKI_EXAMPLE_DIR/$EXAMPLE TARGET=$BOARD BOARD=remote-reva || true
                BUILD_DIR_TEMP=$CONTIKI_EXAMPLE_DIR/$EXAMPLE/build/$BOARD/remote-reva
                echo "1" && echo $BUILD_DIR_TEMP

            elif [[ "$BOARD" == "cc26x0-cc13x0" ]]; then
                make -C $CONTIKI_EXAMPLE_DIR/$EXAMPLE TARGET=$BOARD BOARD=srf06/cc26x0 || true
                BUILD_DIR_TEMP=$CONTIKI_EXAMPLE_DIR/$EXAMPLE/build/$BOARD/srf06/cc26x0
                echo "2" && echo $BUILD_DIR_TEMP

            elif [[ "$BOARD" == "simplelink" ]]; then
                make -C $CONTIKI_EXAMPLE_DIR/$EXAMPLE TARGET=$BOARD BOARD=launchpad/cc1310 || true
                BUILD_DIR_TEMP=$CONTIKI_EXAMPLE_DIR/$EXAMPLE/build/$BOARD/launchpad/cc1310
                echo "3" && echo $BUILD_DIR_TEMP

            elif [[ "$BOARD" == "openmote" ]]; then
                make -C $CONTIKI_EXAMPLE_DIR/$EXAMPLE TARGET=$BOARD BOARD=openmote-b || true
                BUILD_DIR_TEMP=$CONTIKI_EXAMPLE_DIR/$EXAMPLE/build/$BOARD/openmote-b
                echo "4" && echo $BUILD_DIR_TEMP

            else
                make -C $CONTIKI_EXAMPLE_DIR/$EXAMPLE TARGET=$BOARD || true
                BUILD_DIR_TEMP=$CONTIKI_EXAMPLE_DIR/$EXAMPLE/build/$BOARD
                echo "5" && echo $BUILD_DIR_TEMP
            fi

            #check if builf was successful
            if [ -d $CONTIKI_EXAMPLE_DIR/$EXAMPLE/build ]; then

                #create folder for example in output directory
                if [ ! -d $OUT_DIR/CVE-$CVENUM/$EXAMPLE_NAME ]; then
                    mkdir $OUT_DIR/CVE-$CVENUM/$EXAMPLE_NAME
                fi

                cd $BUILD_DIR_TEMP

                #remove all files except .elf and .bin check GLOBIGNORE at the top
                GLOBIGNORE=*.elf:*.bin
                rm -rv *
                unset GLOBIGNORE
                cp -r $BUILD_DIR_TEMP $OUT_DIR/CVE-$CVENUM/$EXAMPLE_NAME
            fi

            cd $CONTIKI_EXAMPLE_DIR/$EXAMPLE && rm -rf build

        fi
    done
done
