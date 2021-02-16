#!/bin/sh

# the script will not work if xrandr is not available
if [ -z "$(which xrandr)" ]; then
    exit 1
fi

DP2_2=$(xrandr | grep -o "DP-2-2 connected" || echo '')
DP2_3=$(xrandr | grep -o "DP-2-3 connected" || echo '')

if [ -n "$DP2_2" ] && [ -n "$DP2_3" ]; then
    xrandr --output DP-2-2 --pos 0x0 --auto --output DP-2-3 --auto --right-of DP-2-2 --output eDP-1 --auto --primary --pos 960x1200
else
    if [ -n "$DP2_2" ]; then
        xrandr --output DP-2-2 --auto --output eDP-1 --auto --below DP-2-2 --primary --output DP-2-3 --off
    elif [ -n "$DP2_3" ]; then
        xrandr --output DP-2-2 --off --output DP-2-3 --auto --output eDP-1 --auto --below DP-2-3 --primary
    else
        xrandr --output DP-2-2 --off --output DP-2-3 --off --output eDP-1 --auto --primary
    fi
fi
