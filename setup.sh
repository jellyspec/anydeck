#!/bin/sh

BOOT_CONFIG_DIR=/boot/firmware
BOOT_CONFIG="$BOOT_CONFIG_DIR/config.txt"
BOOT_CMDLINE="$BOOT_CONFIG_DIR/cmdline.txt"

# install packages
sudo apt-get install openbox deskflow uhubctl xorg mixxx

pushd `pwd`
cd /tmp
wget https://github.com/fasteddy516/pi-usb-automount/releases/latest/download/pi-usb-automount.deb
sudo dpkg -i pi-usb-automount.deb
popd

# disable bloat
sudo systemctl disable NetworkManager ModemManager cups avahi-daemon wpa_supplicant cloud-final
sudo sh -c "echo 'dtoverlay=disable-bt' >> $BOOT_CONFIG"
sudo sh -c "echo 'disable_splash=1' >> $BOOT_CONFIG"
# console=serial0,115200 console=tty1 root=PARTUUID=50a1fd48-02 rootfstype=ext4 fsck.repair=yes rootwait cfg80211.ieee80211_regdom=US
sudo sh -c "sed 's/$/ quiet fastboot loglevel=3/p' $BOOT_CMDLINE > $BOOT_CMDLINE"

# Create system on / off button
sudo sh -c "echo 'dtoverlay=gpio-shutdown,gpio_pin=17,active_low=1,gpio_pull=up,debounce=1000' >> $BOOT_CONFIG"

# autologin to tty1
sudo mkdir -p /etc/systemd/system/getty@tty1.service.d/
sudo sh -c 'echo "[Service]" >> /etc/systemd/system/getty@tty1.service.d/override.conf'
sudo sh -c 'echo "ExecStart=-/sbin/agetty --autologin alyxx --noclear %I \$TERM" >> /etc/systemd/system/getty@tty1.service.d/override.conf'

# Copy configs
cp -r home/.* $HOME/
chmod a+x ~/.xinitrc
