if [ -z "$DISPLAY" ] && [ "$(tty)" = "/dev/tty1" ]; then
  # Reset usb bus to ensure flx4 is recognized before mixxx starts
  sudo uhubctl -l 2 -a 2
  startx -- -keeptty -nocursor >~/.xorg.log 2>&1 -nocursor
fi
