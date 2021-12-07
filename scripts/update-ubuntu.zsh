#!/bin/zsh

# TODO: Add check for VPN connection

echo '\e[34mExecuting\e[0m "\e[32msudo apt \e[33mupdate\e[0m"'
sudo apt update
echo '\e[34mExecuting\e[0m "\e[32mapt \e[33mlist \e[36m--upgradable\e[0m"'
apt list --upgradable
echo '\e[34mExecuting\e[0m "\e[32msudo apt \e[33mupgrade\e[0m"'
sudo apt upgrade

echo '\e[34mExecuting\e[0m "\e[32msudo snap \e[37mrefresh\e[0m"'
sudo snap refresh

echo '\e[34mExecuting\e[0m "\e[32m~/dotfiles/scripts/update-more.sh\e[0m"'
~/dotfiles/scripts/update-more.sh

echo '\e[34mExecuting\e[0m "\e[32m~/dotfiles/scripts/repository-updates.zsh \e[35m~/external-software/\e[0m"'
~/dotfiles/scripts/repository-updates.zsh ~/external-repos/

echo '\e[34mExecuting\e[0m "\e[32msudo fwupdmgr \e[37mrefresh && \e[32msudo fwupdmgr \e[37mget-updates\e[0m"'
sudo fwupdmgr refresh && sudo fwupdmgr get-updates

# Set znap repository folder and check status
zstyle ':znap:*' repos-dir ~/zsh-repos
source ~/zsh-snap/znap.zsh

echo '\e[34mExecuting\e[0m "\e[32mznap \e[37mstatus\e[0m"'
znap status
