#!/usr/bin/env bash
set -e # Exit if a command exits with a non-zero status
set -u # Treat unset variables as an error
set -o pipefail # Treat any non-zero status in a pipeline like a total pipeline failure
shopt -s inherit_errexit # Command substitutions inherit set -e from the parent script

echo '\e[34mExecuting\e[0m "\e[32msudo snap \e[37mrefresh\e[0m"'
sudo snap refresh

echo '\e[34mExecuting\e[0m "\e[32mflatpak \e[37mupdate\e[0m"'
flatpak update

# Rust related
echo '\e[34mExecuting\e[0m "\e[32mrustup \e[37mupdate\e[0m"'
rustup update

# List all installed rust crates
# cargo install --list

echo '\e[34mExecuting\e[0m "\e[32mcargo \e[37minstall
    bat \
    broot \
    click \
    #czkawka_gui \
    difftastic \
    diskus \
    du-dust \
    dua-cli \
    eva \
    exa \
    fclones \
    fd-find \
    find_unicode \
    genact \
    git-delta \
    hyperfine \
    jless \
    jwt-cli \
    tidy-viewer \
    tokei \e[0m"'

cargo install \
    bat \
    broot \
    click \
    difftastic \
    diskus \
    du-dust \
    dua-cli \
    eva \
    exa \
    fclones \
    fd-find \
    find_unicode \
    genact \
    git-delta \
    hyperfine \
    jless \
    jwt-cli \
    tidy-viewer \
    tokei

# ##############################
# Go related

# List all installed go packages
# go list ... or ls -lA ~/go/bin

# Terminal confetti tool
echo '\e[34mExecuting\e[0m "\e[32mgo \e[37minstall github.com/maaslalani/confetty@latest\e[0m"'
go install github.com/maaslalani/confetty@latest

# Terminal countdown tool
echo '\e[34mExecuting\e[0m "\e[32mgo \e[37minstall github.com/antonmedv/countdown@latest\e[0m"'
go install github.com/antonmedv/countdown@latest

# Credential helper for docker to access Amazon ECR
echo '\e[34mExecuting\e[0m "\e[32mgo \e[37minstall github.com/awslabs/amazon-ecr-credential-helper/ecr-login/cli/docker-credential-ecr-login@latest\e[0m"'
go install github.com/awslabs/amazon-ecr-credential-helper/ecr-login/cli/docker-credential-ecr-login@latest

# Tool for disk space analysis
echo '\e[34mExecuting\e[0m "\e[32mgo \e[37minstall github.com/dundee/gdu/v5/cmd/gdu@latest\e[0m"'
go install github.com/dundee/gdu/v5/cmd/gdu@latest

# Tool to fetch gitignore files from GitHub templates `gig`
echo '\e[34mExecuting\e[0m "\e[32mgo \e[37minstall github.com/toshi0607/gig@latest\e[0m"'
go install github.com/toshi0607/gig@latest

# Tool to check the size of git repositories `git-sizer`
echo '\e[34mExecuting\e[0m "\e[32mgo \e[37minstall github.com/github/git-sizer@latest\e[0m"'
go install github.com/github/git-sizer@latest

# Go language server
# go install golang.org/x/tools/gopls@latest

# Tool to manage hosts file idempotent `hostess`
echo '\e[34mExecuting\e[0m "\e[32mgo \e[37minstall github.com/cbednarski/hostess@latest\e[0m"'
go install github.com/cbednarski/hostess@latest

# Tool for fast code search `houndd`
echo '\e[34mExecuting\e[0m "\e[32mgo \e[37minstall github.com/hound-search/hound/cmds/...@latest\e[0m"'
go install github.com/hound-search/hound/cmds/...@latest

# technology detector tool
echo '\e[34mExecuting\e[0m "\e[32mgo \e[37minstall github.com/projectdiscovery/httpx/cmd/httpx@latest\e[0m"'
go install -v github.com/projectdiscovery/httpx/cmd/httpx@latest

# terminal file manager
echo '\e[34mExecuting\e[0m "\e[32menv CGO_ENABLED=0 go \e[37minstall -ldflags="-s -w" github.com/gokcehan/lf@latest\e[0m"'
env CGO_ENABLED=0 go install -ldflags="-s -w" github.com/gokcehan/lf@latest

# minio
# echo '\e[34mExecuting\e[0m "\e[32mgo \e[37minstall github.com/minio/mc@latest\e[0m"'
# go install github.com/minio/mc@latest

#minica
echo '\e[34mExecuting\e[0m "\e[32mgo \e[37minstall github.com/jsha/minica@latest\e[0m"'
go install github.com/jsha/minica@latest

# rclone update
echo "To update rclone"
echo "sudo -v ; curl https://rclone.org/install.sh | sudo bash"

# Shell format
echo '\e[34mExecuting\e[0m "\e[32mgo \e[37minstall mvdan.cc/sh/v3/cmd/shfmt@latest\e[0m"'
go install mvdan.cc/sh/v3/cmd/shfmt@latest

# staticcheck from https://github.com/dominikh/go-tools

# Subdomain enumeration
echo '\e[34mExecuting\e[0m "\e[32mgo \e[37minstall -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest\e[0m"'
go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest

# Tool to visualize most used cli commands `tsukae`
echo '\e[34mExecuting\e[0m "\e[32mgo \e[37minstall github.com/irevenko/tsukae@latest\e[0m"'
go install github.com/irevenko/tsukae@latest

# Modern watch alternative
echo '\e[34mExecuting\e[0m "\e[32mgo \e[37minstall github.com/sachaos/viddy@latest\e[0m"'
go install github.com/sachaos/viddy@latest

# ##############################

echo '\e[34mExecuting\e[0m "\e[32m~/dotfiles/scripts/repository-updates.zsh \e[35m~/external-software/\e[0m"'
~/dotfiles/scripts/repository-updates.zsh ~/external-repos/

echo 'not \e[34mExecuting\e[0m "\e[32msudo fwupdmgr \e[37mrefresh && \e[32msudo fwupdmgr \e[37mget-updates\e[0m"'
# sudo fwupdmgr refresh && sudo fwupdmgr get-updates


echo 'To update zsh4humans'
echo 'z4h update'

echo 'Install VSCode extension updates'
echo 'code --list-extensions | xargs -n 1 code --force --install-extension'

# Even more applications
# echo 'running kitty install script'
# curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin

## AppImageLauncher install steps

# sudo apt install software-properties-common
# sudo add-apt-repository ppa:appimagelauncher-team/stable
# sudo apt update
# sudo apt install appimagelauncher

## git

# add-apt-repository ppa:git-core/ppa # apt update; apt install git

## KeePassXC

# sudo add-apt-repository ppa:phoerious/keepassxc
# sudo apt update; sudo apt install keepassxc

## OBS

# sudo add-apt-repository ppa:obsproject/obs-studio
# sudo apt update
# sudo apt-get update && sudo apt-get install obs-studio

## Pipewire

# sudo add-apt-repository ppa:pipewire-debian/pipewire-upstream

## Wireplumber

# sudo add-apt-repository ppa:pipewire-debian/wireplumber-upstream

# Google Chrome

# wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -

# sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
