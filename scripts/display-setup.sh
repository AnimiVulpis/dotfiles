#!/bin/sh

# the script will not work if xrandr is not available
if [ -z "$(which xrandr)" ]; then
    exit 1
fi

DP2_1=$(xrandr | grep -o "DP-2-1 connected" || echo '')

if [ -n "$DP2_1" ]; then
    xrandr --output DP-2-1 --pos 0x0 --auto --output eDP-1 --auto --primary --pos 760x1440
fi
