#!/bin/bash

#Absolute path to this script, e.g. /home/user/bin/foo.sh
SCRIPT=$(readlink -f "$0")
#Absolute path this script is in, thus /home/user/bin
SCRIPT_PATH=$(dirname "$SCRIPT")

cd $SCRIPT_PATH/beaglebone_external/package
echo "Cloning external buildroot package vpbus..."
git clone https://github.com/Inounx/vpbus.git vpbus

echo "Cloning external buildroot package vpbus_gpiolib..."
git clone -b gpiolib https://github.com/Inounx/vpbus.git vpbus_gpiolib

echo "Cloning external buildroot package vpbus_test..."
git clone https://github.com/Inounx/vpbus-test.git vpbus_test

echo "Cloning buildroot repository..."
git clone http://git.buildroot.net/git/buildroot.git $SCRIPT_PATH/buildroot
cd $SCRIPT_PATH/buildroot
git checkout -b virtuailes 2016.05

mkdir $SCRIPT_PATH/output

echo "Configuring buildroot..."
make -C $SCRIPT_PATH/buildroot \
     BR2_EXTERNAL=$SCRIPT_PATH/beaglebone_external \
     virtuailes_beaglebone_defconfig

echo "Buildroot initialization done!"
