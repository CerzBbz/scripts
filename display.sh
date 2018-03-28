#!/bin/sh
if [ "$1" = "laptop" ]; then
    xrandr --output VGA-1 --off --output eDP-1 --primary --auto --output HDMI-1 --off
elif [ "$1" = "tv" ]; then
    xrandr --output VGA-1 --off --output eDP-1 --off --output HDMI-1 --auto
else
    xrandr --output VGA-1 --off --output eDP-1 --primary --auto --output HDMI-1 --auto --right-of eDP-1
fi
