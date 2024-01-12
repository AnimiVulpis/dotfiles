#!/usr/bin/env bash
set -e                   # Exit if a command exits with a non-zero status
set -u                   # Treat unset variables as an error
set -o pipefail          # Treat any non-zero status in a pipeline like a total pipeline failure
shopt -s inherit_errexit # Command substitutions inherit set -e from the parent script

# Rust related
printf '\e[34mExecuting\e[0m "\e[32mrustup \e[37mupdate\e[0m"\n'
rustup update

# List all installed rust crates
# cargo install --list

printf '\e[34mExecuting\e[0m "\e[32mcargo \e[37minstall cracken genact jwt-cli tailspin tlrc\e[0m"\n'

cargo install \
    cracken \
    genact \
    jwt-cli \
    tailspin \
    tlrc

# ##############################
# Go related

# List all installed go packages
# go list ... or ls -lA ~/go/bin

# Terminal confetti tool
printf '\e[34mExecuting\e[0m "\e[32mgo \e[37minstall github.com/maaslalani/confetty@latest\e[0m"\n'
go install github.com/maaslalani/confetty@latest

# Terminal countdown tool
printf '\e[34mExecuting\e[0m "\e[32mgo \e[37minstall github.com/antonmedv/countdown@latest\e[0m"\n'
go install github.com/antonmedv/countdown@latest

# Terminal time tracking tool
printf '\e[34mExecuting\e[0m "\e[32mgo \e[37minstall github.com/jotaen/klog@latest\e[0m"\n'
go install github.com/jotaen/klog@latest

# Tool to visualize most used cli commands `tsukae`
printf '\e[34mExecuting\e[0m "\e[32mgo \e[37minstall github.com/irevenko/tsukae@latest\e[0m"\n'
go install github.com/irevenko/tsukae@latest

# ##############################

printf '\e[34mExecuting\e[0m "\e[32m~/dotfiles/scripts/repository-updates.zsh \e[35m~/external-software/\e[0m"\n'
~/dotfiles/scripts/repository-updates.zsh ~/external-repos/

echo 'To update zsh4humans'
echo 'z4h update'

printf '\e[34mExecuting\e[0m "\e[32mbrew\e[0m update && \e[32mbrew\e[0m upgrade"\n'
brew update && brew upgrade
