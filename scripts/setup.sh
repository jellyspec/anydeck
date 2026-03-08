#!/bin/bash

# Usage: sudo ./setup.sh [--dev]
#
# Default (prod) mode: disables all network services for a fully standalone appliance.
# --dev mode: keeps NetworkManager and wpa_supplicant enabled so WiFi works for
#   deskflow remote debugging. Writes ~/.deckshark-dev so .xinitrc starts deskflow-client.

. functions

if [ "$(id -u)" -ne 0 ]; then
  echo "Please re-run this as root." >&2
  exit
fi

DEV_MODE=0
if [ "${1}" = "--dev" ]; then
  DEV_MODE=1
fi

CURRENT_USER="${SUDO_USER:-$(whoami)}"

# install packages
apt-get update
apt-get install -y openbox deskflow uhubctl xorg mixxx

# install pi-usb-automount if not present
if ! dpkg -S pi-usb-automount >/dev/null 2>&1; then
  pushd "$(pwd)"
  cd /tmp
  wget https://github.com/fasteddy516/pi-usb-automount/releases/latest/download/pi-usb-automount.deb
  dpkg -i pi-usb-automount.deb
  popd
fi

# disable bloat
BOOT_CONFIG_DIR=/boot/firmware
BOOT_CONFIG="$BOOT_CONFIG_DIR/config.txt"
BOOT_CMDLINE="$BOOT_CONFIG_DIR/cmdline.txt"

# always disable these — not needed in any mode
systemctl disable lightdm display-manager ModemManager avahi-daemon cloud-final

# disable network services in prod only
if [ "$DEV_MODE" -eq 0 ]; then
  systemctl disable NetworkManager wpa_supplicant
fi

# write or remove dev mode marker for .xinitrc
DEV_MARKER="/home/${CURRENT_USER}/.deckshark-dev"
if [ "$DEV_MODE" -eq 1 ]; then
  touch "$DEV_MARKER"
else
  rm -f "$DEV_MARKER"
fi

write_if_missing "dtoverlay=disable-bt" "$BOOT_CONFIG"
append_if_missing "fastboot loglevel=3" "$BOOT_CMDLINE"

# Create system on / off button (GPIO 17)
write_if_missing "dtoverlay=gpio-shutdown,gpio_pin=17,active_low=1,gpio_pull=up,debounce=1000" "$BOOT_CONFIG"

# autologin to tty1 as CURRENT_USER
SYSTEMD_DIR=/etc/systemd/system
SERVICE_DIR="${SYSTEMD_DIR}/getty@tty1.service.d"
mkdir -p "$SERVICE_DIR"

write_if_missing "[Service]" "$SERVICE_DIR/override.conf"
write_if_missing "ExecStart=" "$SERVICE_DIR/override.conf"
write_if_missing "ExecStart=-/sbin/agetty --autologin ${CURRENT_USER} --noclear %I \$TERM" "$SERVICE_DIR/override.conf"

# Link configs from repo home/ into the real home
HOME_CONFIGS_DIR="$(pwd)/../home"
TRUE_HOME="/home/${CURRENT_USER}"
for path in $(ls -a1 "$HOME_CONFIGS_DIR" | sed 1,2d); do
  echo "Linking file ${path}..."
  test -f "${TRUE_HOME}/${path}" && rm "${TRUE_HOME}/${path}"
  test -d "${TRUE_HOME}/${path}" && rm -rf "${TRUE_HOME}/${path}"
  ln -s "${HOME_CONFIGS_DIR}/${path}" "${TRUE_HOME}/${path}"
done
