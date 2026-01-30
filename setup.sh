#!/bin/sh

$BOOT_CONFIG_DIR=/boot/firmware
$BOOT_CONFIG=$BOOT_CONFIG_DIR/config.txt
$BOOT_CMDLINE=$BOOT_CONFIG_DIR/cmdline.txt

# install packages
sudo apt-get install openbox deskflow uhubctl

# disable bloat
sudo systemctl disable NetworkManager
echo 'dtoverlay=disable-bt' >> $BOOT_CONFIG
echo 'disable_splash=1' >> $BOOT_CONFIG
sudo sh -c "sed 's/$/ quiet fastboot loglevel=3/' $BOOT_CMDLINE > $BOOT_CMDLINE"

# Create system on / off button
echo 'dtoverlay=gpio-shutdown,gpio_pin=17,active_low=1,gpio_pull=up,debounce=1000' >> $BOOT_CONFIG

# Copy configs
cp -r home/.* $HOME/
chmod a+x ~/.xinitrc
