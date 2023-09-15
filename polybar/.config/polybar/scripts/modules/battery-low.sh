#!/bin/sh

battery_level=$(acpi -b | grep -P -o '[0-9]+(?=%)')

is_charging=$(acpi -b | grep -c "Charging")

if [ "$is_charging" -eq 0 ] && [ "$battery_level" -lt 15 ]; then
	notify-send "Low battery Warning" "You have less than 15% battery right now. Please charge me or I will die soon."
	sleep 2700
fi
