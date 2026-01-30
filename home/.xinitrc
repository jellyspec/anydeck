#!/bin/bash

openbox &

deskflow-client --daemon --restart --enable-crypto --tls-cert ~/.config/Deskflow/tls/deskflow.pem 192.168.1.96

# Reset usb bus to ensure flx4 is recognized before mixxx starts
sudo uhubctl -l 2 -a 2
sleep 3

while [ 1 ]; do
  /usr/bin/mixxx 2>&1 > ~/mixxx.log
  echo "Mixxx has exited, restarting..."
  sleep 5
  killall mixxx
done
