#!/bin/bash

openbox &

REMOTE_DEBUG_HOST=192.168.1.96

deskflow-client --daemon --restart "$REMOTE_DEBUG_HOST"

while [ 1 ]; do
  /usr/bin/mixxx
  echo "Mixxx has exited, restarting..."
  sleep 3
  killall mixxx
done
