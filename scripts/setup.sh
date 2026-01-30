#!/bin/bash

. functions

if [ `id -u` -ne 0 ]; then
  echo "Please re-run this as root." >&2
  exit
fi

# install packages
apt-get install openbox deskflow uhubctl xorg mixxx
if ! dpkg -S pi-usb-automount; then
  pushd `pwd`
  cd /tmp
  wget https://github.com/fasteddy516/pi-usb-automount/releases/latest/download/pi-usb-automount.deb
  dpkg -i pi-usb-automount.deb
  popd
fi

# disable bloat
BOOT_CONFIG_DIR=/boot/firmware
BOOT_CONFIG="$BOOT_CONFIG_DIR/config.txt"
BOOT_CMDLINE="$BOOT_CONFIG_DIR/cmdline.txt"
systemctl disable NetworkManager ModemManager avahi-daemon wpa_supplicant cloud-final
write_if_missing "echo 'dtoverlay=disable-bt'" "$BOOT_CONFIG"
append_if_missing "fastboot loglevel=3" "$BOOT_CMDLINE"

# Create system on / off button
write_if_missing "echo 'dtoverlay=gpio-shutdown,gpio_pin=17,active_low=1,gpio_pull=up,debounce=1000'" "$BOOT_CONFIG"

# autologin to tty1
SYSTEMD_DIR=/etc/systemd/system
SERVICE_DIR="${SYSTEMD_DIR}/getty@tty1.service.d"
sudo mkdir -p "$SERVICE_DIR"

write_if_missing "[Service]" "$SERVICE_DIR/override.conf"
write_if_missing "ExecStart=" "$SERVICE_DIR/override.conf"
write_if_missing "ExecStart=-/sbin/agetty --autologin alyxx --noclear %I \$TERM" "$SERVICE_DIR/override.conf"

# Link configs
HOME_CONFIGS_DIR="$(pwd)/../home"
for path in "$(ls -a1 \"$HOME_CONFIGS_DIR\")"; do
  test -f "${HOME}/${path}" && rm "${HOME}/${path}"
  ln -s "${HOME_CONFIGS_DIR}/${path}" "${HOME}/${path}"
fi
