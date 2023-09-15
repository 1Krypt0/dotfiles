#!/bin/sh

if ! updates_arch=$(pacman -Qu | wc -l ); then
    updates_arch=0
fi

if ! updates_aur=$(paru -Qum | wc -l); then
    updates_aur=0
fi

updates=$(($updates_arch + $updates_aur))


if [ "$updates" -gt 0 ]; then
    echo "$updates available" & 
    notify-send "Update available" -i ~/.config/dunst/icons/arrow-down-circled-svgrepo-com.svg "\"$updates\" to be exact. Feeling like a boomer. Update me." 
else
    echo "Up to date"
fi
