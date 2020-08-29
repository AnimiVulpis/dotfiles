#!/bin/zsh
sudo pacman -Syu
sudo snap refresh
flatpak update
~/dotfiles/repository-updates.sh ~/aur-and-external/
sudo fwupdmgr refresh &&
  sudo fwupdmgr get-updates
