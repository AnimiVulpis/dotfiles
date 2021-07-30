#!/bin/zsh

echo '\e[34mExecuting\e[0m "\e[32msudo pacman \e[36m--color \e[37malways \e[36m-Syu\e[0m"'
sudo pacman --color always -Syu

echo '\e[34mExecuting\e[0m "\e[32msudo snap \e[37mrefresh\e[0m"'
sudo snap refresh

echo '\e[34mExecuting\e[0m "\e[32mflatpak \e[37mupdate\e[0m"'
flatpak update

echo '\e[34mExecuting\e[0m "\e[32m~/dotfiles/scripts/update-more.sh\e[0m"'
~/dotfiles/scripts/update-more.sh

echo '\e[34mExecuting\e[0m "\e[32m~/dotfiles/scripts/repository-updates.sh \e[35m~/aur-software/\e[0m"'
~/dotfiles/scripts/repository-updates.sh ~/aur-software/

echo '\e[34mExecuting\e[0m "\e[32msudo fwupdmgr \e[37mrefresh && \e[32msudo fwupdmgr \e[37mget-updates\e[0m"'
sudo fwupdmgr refresh \
    && sudo fwupdmgr get-updates

echo '\e[34mMaybe execute\e[0m "\e[32mzinit \e[33mself-update \e[37m&& \e[32mzinit \e[33mupdate\e[0m"?'
