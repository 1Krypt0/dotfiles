#!/bin/bash

MONITORS=$(xrandr -q | grep -w "connected" | wc -l)

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch Polybar, using default config location ~/.config/polybar/config
#

if [[ $MONITORS -eq 1 ]]; then
  polybar background &
  polybar datetime &
  polybar bspwm &
  polybar media &
  polybar volume &
  polybar netspeed &
  polybar battnet &
  polybar netstuff &
elif [[ $MONITORS -eq 2 ]]; then
    polybar background &
    polybar background_left &
    polybar bspwm &
    polybar bspwm_left &
    polybar media &
    polybar media_left &
    polybar datetime &
    polybar datetime_left &
    polybar netstuff &
    polybar netstuff_left &
    polybar volume &
    polybar volume_left &
    polybar battnet &
    polybar battnet_left &
    polybar netspeed &
    polybar netspeed_left &
elif [[ $MONITORS -eq 3 ]]; then
    polybar background &
    polybar background_left &
    polybar background_right &
    polybar bspwm &
    polybar bspwm_left &
    polybar bspwm_right &
    polybar media &
    polybar datetime &
    polybar datetime_left &
    polybar datetime_right &
    polybar netstuff &
    polybar volume &
    polybar volume_left &
    polybar volume_right &
    polybar battnet &
    polybar netspeed &
fi
