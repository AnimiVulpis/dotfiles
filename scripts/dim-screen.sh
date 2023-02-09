#!/bin/bash

# Adapted from `/usr/share/doc/xss-lock/dim-screen2.sh`

active_monitors=$(xrandr --listactivemonitors | tail -n +2 | cut -d' ' -f3 | rg -oe '[\w_-]+')

function setBrightness() {
    for monitor in $active_monitors; do
        xrandr --output $monitor --brightness $1
    done
}

trap "setBrightness 1.0" EXIT
trap 'kill %%; exit 0' HUP
trap 'sleep 1s; kill %%; exit 0' TERM

for step in $(seq 0.99 -0.02 0.25 | tr ',' '.'); do
    sleep 1
    setBrightness $step
done

wait
sleep infinity &
wait
