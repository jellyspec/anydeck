#!/bin/bash

openbox &

feh --bg-center ~/.mixxx/skins/Pioneered/images/pioneered_logo.png

if [ -f "$HOME/.deckshark-dev" ]; then
  REMOTE_DEBUG_HOST=192.168.1.96
  deskflow-client --daemon --restart "$REMOTE_DEBUG_HOST"
fi

while [ 1 ]; do
  /usr/bin/mixxx
  echo "Mixxx has exited, restarting..."
  sleep 3
  killall mixxx
done
