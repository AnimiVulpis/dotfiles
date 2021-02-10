#!/bin/zsh
sudo pacman --color always -Syu
cabal install --overwrite-policy=always arbtt
sudo snap refresh
flatpak update
~/dotfiles/scripts/repository-updates.sh ~/aur-and-external/
sudo fwupdmgr refresh \
    && sudo fwupdmgr get-updates
