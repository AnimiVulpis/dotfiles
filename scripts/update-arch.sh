#!/bin/zsh
sudo pacman -Syu
sudo snap refresh
flatpak update
~/dotfiles/scripts/repository-updates.sh ~/aur-and-external/
sudo fwupdmgr refresh &&
  sudo fwupdmgr get-updates