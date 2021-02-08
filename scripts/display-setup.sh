#!/bin/sh

# the script will not work if xrandr is not available
if [ -z "$(which xrandr)" ]; then
    exit 1
fi

DP2_2=$(xrandr | grep -o "DP-2-2 connected" || echo '')
DP2_3=$(xrandr | grep -o "DP-2-3 connected" || echo '')

if [ -n "$DP2_2" ] && [ -n "$DP2_3" ]; then
    xrandr --output DP-2-2 --auto --output eDP-1 --auto --below DP-2-2 --primary --output DP-2-3 --auto --pos 1920x-180
else
    if [ -n "$DP2_2" ]; then
        xrandr --output DP-2-2 --auto --output eDP-1 --auto --below DP-2-2 --primary
    else
        xrandr --output DP-2-2 --off --output eDP-1 --auto --primary
    fi
    if [ -n "$DP2_3" ]; then
        xrandr --output DP-2-3 --auto --output eDP-1 --auto --below DP-2-3 --primary
    else
        xrandr --output DP-2-3 --off --output eDP-1 --auto --primary
    fi
fi
