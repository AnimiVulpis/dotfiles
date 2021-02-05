#!/bin/sh

# the script will not work if xrandr is not available
if [ -z "$(which xrandr)" ]; then
    exit 1
fi

DP2_3=$(xrandr | grep -o "DP-2-3 connected" || echo '')

if [ -n "$DP2_3" ]; then
    xrandr --output DP-2-3 --auto --output eDP-1 --auto --below DP-2-3 --primary
else
    xrandr --output DP-2-3 --off --output eDP-1 --auto --primary
fi
