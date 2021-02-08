#!/bin/zsh

set -e

unranked_mirrors="/home/animi_vulpis/downloads/mirrorlist_unranked"
ranked_mirrors="/home/animi_vulpis/downloads/mirrorlist"
mirrorlist_url="https://archlinux.org/mirrorlist/?country=HR&country=CZ&country=DK&country=FI&country=FR&country=DE&country=IE&country=IT&country=LV&country=LT&country=LU&country=NL&country=NO&country=PL&country=SE&protocol=https&ip_version=4&use_mirror_status=on"

echo "Downloading mirrorlist from https://archlinux.org/mirrorlist"
curl -s "$mirrorlist_url" | sed -e 's/^#Server/Server/' -e '/^#/d' > $unranked_mirrors

echo "Ranking mirrors"
rankmirrors -v -n 30 $unranked_mirrors > $ranked_mirrors
rm -v $unranked_mirrors

rg -e 'Server' $ranked_mirrors

echo "Attempting to overwrite pacman mirrorlist"
sudo mv -vi ~/downloads/mirrorlist /etc/pacman.d/mirrorlist

if [ -f /etc/pacman.d/mirrorlist.pacnew ]; then
    echo "Attempting to delete pacman created backup mirrorlist"
    sudo rm -vi /etc/pacman.d/mirrorlist.pacnew
fi
