#!/usr/bin/env bash

xrandr --output eDP-1-1 --off &

xrandr --output HDMI-0 --primary --mode 1920x1080 --rotate normal --output DP-1 --mode 1920x1080 --rotate normal --right-of HDMI-0 &

bspc monitor eDP-1-1 --remove &
bspc monitor DP-1 -d web brain discord reader spotify &
bspc monitor HDMI-0 -d term dev code &

killall polybar &

"$HOME"/.config/polybar/two-monitors.sh &

xmodmap ~/.dotfiles/xmodmap
