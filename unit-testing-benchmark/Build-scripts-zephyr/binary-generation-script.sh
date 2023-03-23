#!/bin/bash
#This script automates the binary generation with given CVE, BOARD and sample

set -x
set -e

# Restore git state
if [ ! -e "$ZEPHYR_HOME/zephyr" ]; then
    west init --mr=zephyr-v$ZEPHYR_VERSION $ZEPHYR_HOME
    cd $ZEPHYR_HOME
    west update
fi

export ZEPHYR_SDK_INSTALL_DIR=/home/sidharth/zephyr-sdk-$ZEPHYR_SDK_VERSION
export ZEPHYR_BASE_DIR=$ZEPHYR_HOME/zephyr
export ZEPHYR_TOOLCHAIN_VARIANT=zephyr
export SAMPLE_HOME=$ZEPHYR_BASE_DIR/samples

# Generating a list of boards from the env variable defined
INDEX=0
for name in $BOARD_NAMES; do
    BOARD_NAME[$INDEX]=$name
    INDEX=$(( $INDEX + 1 ))
done


# Build sample
INDEX=0
for BOARD in $BOARDS; do
    
    cd $OUT_DIR
    mkdir ${BOARD_NAME[$INDEX]}

    for SAMPLE in $SAMPLE_DIR; do
        if [ -d $SAMPLE ]; then
            cd $SAMPLE
            rm -rf build

            SAMPLE_NAME="$(basename -- $SAMPLE)"
            SAMPLE_CLASS=$(echo "$SAMPLE" | cut -d / -f 7)

            if [ -d $OUT_DIR/${BOARD_NAME[$INDEX]}/$SAMPLE_CLASS-$SAMPLE_NAME ]; then
                rm -rf $OUT_DIR/${BOARD_NAME[$INDEX]}/$SAMPLE_CLASS-$SAMPLE_NAME;
            fi
        
            mkdir $OUT_DIR/${BOARD_NAME[$INDEX]}/$SAMPLE_CLASS-$SAMPLE_NAME
            west build --pristine always -b "$BOARD" || true

            if [ -f build/zephyr/zephyr.elf ]; then
                cp build/zephyr/zephyr.elf $OUT_DIR/${BOARD_NAME[$INDEX]}/$SAMPLE_CLASS-$SAMPLE_NAME/Zephyr-$ZEPHYR_VER-$ARCH-${BOARD_NAME[$INDEX]}-$SAMPLE_CLASS-$SAMPLE_NAME.elf
            fi
            if [ -f build/zephyr/zephyr.bin ]; then  
                cp build/zephyr/zephyr.bin $OUT_DIR/${BOARD_NAME[$INDEX]}/$SAMPLE_CLASS-$SAMPLE_NAME/Zephyr-$ZEPHYR_VER-$ARCH-${BOARD_NAME[$INDEX]}-$SAMPLE_CLASS-$SAMPLE_NAME.bin
            fi
            rm -rf build
        fi   
    done   

    cd $OUT_DIR/${BOARD_NAME[$INDEX]}
    find . -type d -empty -delete
    INDEX=$(( $INDEX + 1 ))
    
done

echo "==================== Binary generation for $BOARDS completed ===================="