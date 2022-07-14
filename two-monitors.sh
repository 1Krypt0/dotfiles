#!/usr/bin/env bash

xrandr --output --off

xrandr --output HDMI-1-0 --primary --mode 1920x1080 --rotate normal --output DP-1-1 --mode 1920x1080 --rotate normal --right-of HDMI-1-0

bspc monitor DP-1-1 -d web brain discord reader spotify
bspc monitor HDMI-1-0 -d term dev code

killall polybar

"$HOME"/.config/polybar/two-monitors.sh

setxkbmap pt &
