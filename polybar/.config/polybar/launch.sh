#!/bin/bash

MONITORS=$(xrandr -q | grep -w "connected" | wc -l)

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch Polybar, using default config location ~/.config/polybar/config
#

if [[ $MONITORS -eq 1 ]]; then
  polybar datetime &
  polybar bspwm &
  polybar volume &
  polybar netspeed &
  polybar battnet &
elif [[ $MONITORS -eq 2 ]]; then
    polybar datetime &
    polybar datetime_left &
    polybar bspwm &
    polybar bspwm_left &
    polybar volume &
    polybar volume_left &
    polybar netspeed &
    polybar netspeed_left &
    polybar battnet &
    polybar battnet_left &
elif [[ $MONITORS -eq 3 ]]; then
    polybar bspwm &
    polybar bspwm_left &
    polybar bspwm_right &
    polybar datetime &
    polybar datetime_left &
    polybar datetime_right &
    polybar volume &
    polybar volume_left &
    polybar volume_right &
    polybar battnet &
    polybar netspeed &
fi
