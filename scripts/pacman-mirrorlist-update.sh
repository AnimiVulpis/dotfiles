#!/bin/zsh

set -e

mirrorlist_url="https://archlinux.org/mirrorlist/?country=HR&country=CZ&country=DK&country=FI&country=FR&country=DE&country=IE&country=IT&country=LV&country=LT&country=LU&country=NL&country=NO&country=PL&country=SE&protocol=https&ip_version=4&use_mirror_status=on"

curl -s "$mirrorlist_url" | sed -e 's/^#Server/Server/' -e '/^#/d' | rankmirrors -n 30 - ~/downloads/mirrorlist >!

sudo mv -vi ~/downloads/mirrorlist /etc/pacman.d/mirrorlist

if [ -a /etc/pacman.d/mirrorlist.pacnew ]; then
    sudo rm -vi /etc/pacman.d/mirrorlist.pacnew
fi
