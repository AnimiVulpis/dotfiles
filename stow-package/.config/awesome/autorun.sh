#!/bin/bash

function run_if_not_already_running {
    if ! pgrep -f "$1"; then
        "$@" &
    fi
}

xset s on
xset s 900 7
run_if_not_already_running xss-lock -n /usr/lib/xsecurelock/dimmer -l -- \
    env \
    XSECURELOCK_AUTH_TIMEOUT=60 \
    XSECURELOCK_BLANK_TIMEOUT=10 \
    XSECURELOCK_BLANK_DPMS_STATE=off \
    XSECURELOCK_BURNIN_MITIGATION=500 \
    XSECURELOCK_DATETIME_FORMAT='%Y-%m-%d %T' \
    XSECURELOCK_FONT='Iosevka Medium Extended' \
    XSECURELOCK_PASSWORD_PROMPT=cursor \
    XSECURELOCK_SAVER=saver_blank \
    XSECURELOCK_SHOW_DATETIME=1 \
    XSECURELOCK_SHOW_HOSTNAME=1 \
    xsecurelock -- loginctl lock-session # lock session after screen locking

run_if_not_already_running aw-qt
run_if_not_already_running redshift-gtk
