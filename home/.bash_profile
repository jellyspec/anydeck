if [ -z "$DISPLAY" ] && [ "$(tty)" = "/dev/tty1" ]; then
  startx -- -keeptty -nocursor >~/.xorg.log 2>&1 -nocursor
fi
