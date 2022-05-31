#!/bin/zsh

# TODO: Add check for VPN connection

echo '\e[34mExecuting\e[0m "\e[32msudo apt \e[33mupdate\e[0m"'
sudo apt update
echo '\e[34mExecuting\e[0m "\e[32mapt \e[33mlist \e[36m--upgradable\e[0m"'
apt list --upgradable
echo '\e[34mExecuting\e[0m "\e[32msudo apt \e[33mupgrade\e[0m"'
sudo apt upgrade

echo '\e[34mExecuting\e[0m "\e[32m~/dotfiles/scripts/update-more.sh\e[0m"'
~/dotfiles/scripts/update-more.sh
