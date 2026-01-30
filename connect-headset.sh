#!/usr/bin/env bash

MAC="00:16:94:2B:88:85"

bluetoothctl disconnect $MAC
bluetoothctl remove $MAC

FOUND=0
while read -r line; do
  echo $line
  if grep -qi "$MAC" <<<"$line"; then
    FOUND=1
    echo "FOUND"
    break
  fi
done < <(bluetoothctl -t 10 scan on 2>&1)

if [ $FOUND -eq 1 ]; then
  bluetoothctl pair $MAC
  bluetoothctl trust $MAC
  bluetoothctl connect $MAC
  echo "connected"
else
  echo "couldn't find device"
fi
