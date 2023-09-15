#!/usr/bin/env bash

killall -q polybar
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done
  polybar background_new &
  polybar datetime_new &
  polybar bspwm_new &
  polybar media_new &
  polybar volume_new &
  polybar netspeed_new &
  polybar battnet_new &
  polybar background_left &
  polybar bspwm_left &
  polybar datetime_left &
  polybar volume_left &
