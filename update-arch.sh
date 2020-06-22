#!/bin/zsh
sudo pacman -Syu
sudo snap refresh
flatpak update
~/dotfiles/repository-updates.sh
sudo fwupdmgr refresh &&
  sudo fwupdmgr get-updates
