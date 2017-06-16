#!/bin/bash

#Absolute path to this script, e.g. /home/user/bin/foo.sh
SCRIPT=$(readlink -f "$0")
#Absolute path this script is in, thus /home/user/bin
SCRIPT_PATH=$(dirname "$SCRIPT")

cd $SCRIPT_PATH/rpi_external
mkdir package
cd package
echo "Cloning external buildroot package vpbus..."
git -b rpi_gpio clone https://github.com/Inounx/vpbus.git vpbus

echo "Cloning external buildroot package vpbus_test..."
git clone -b rpi https://github.com/Inounx/vpbus-test.git vpbus_test

echo "Cloning buildroot repository..."
git clone http://git.buildroot.net/git/buildroot.git $SCRIPT_PATH/buildroot
cd $SCRIPT_PATH/buildroot
git checkout -b virtuailes 2017.02

echo "Configuring buildroot..."
make -C $SCRIPT_PATH/buildroot \
     BR2_EXTERNAL=$SCRIPT_PATH/rpi_external \
     virtuailes_raspberrypi3_defconfig

echo "Buildroot initialization done!"
