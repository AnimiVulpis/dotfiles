#!/bin/zsh

echo '\e[34mExecuting\e[0m "\e[32msudo snap \e[37mrefresh\e[0m"'
sudo snap refresh

echo '\e[34mExecuting\e[0m "\e[32m flatpak \e[37mupdate\e[0m"'
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
    ncspot \
    sheldon \
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
    ncspot \
    sheldon \
    tidy-viewer \
    tokei
cargo install --version 0.1.0-alpha.5 gobang

# Go related

# List all installed go packages
# go list ...

# Credential helper for docker to access Amazon ECR
echo '\e[34mExecuting\e[0m "\e[32mgo \e[37minstall github.com/awslabs/amazon-ecr-credential-helper/ecr-login/cli/docker-credential-ecr-login@latest\e[0m"'
go install github.com/awslabs/amazon-ecr-credential-helper/ecr-login/cli/docker-credential-ecr-login@latest
# Tool to manage hosts file idempotent `hostess`
echo '\e[34mExecuting\e[0m "\e[32mgo \e[37minstall github.com/cbednarski/hostess@latest\e[0m"'
go install github.com/cbednarski/hostess@latest
# Tool for disk space analysis
echo '\e[34mExecuting\e[0m "\e[32mgo \e[37minstall github.com/dundee/gdu/v5/cmd/gdu@latest\e[0m"'
go install github.com/dundee/gdu/v5/cmd/gdu@latest
# Tool for fast code search `houndd`
echo '\e[34mExecuting\e[0m "\e[32mgo \e[37minstall github.com/hound-search/hound/cmds/...@latest\e[0m"'
go install github.com/hound-search/hound/cmds/...@latest
# Tool to fetch gitignore files from GitHub templates `gig`
echo '\e[34mExecuting\e[0m "\e[32mgo \e[37minstall github.com/toshi0607/gig@latest\e[0m"'
go install github.com/toshi0607/gig@latest
# Tool to check the size of git repositories `git-sizer`
echo '\e[34mExecuting\e[0m "\e[32mgo \e[37minstall github.com/github/git-sizer@latest\e[0m"'
go install github.com/github/git-sizer@latest
# Tool to visualize most used cli commands `tsukae`
echo '\e[34mExecuting\e[0m "\e[32mgo \e[37minstall github.com/irevenko/tsukae@latest\e[0m"'
go install github.com/irevenko/tsukae@latest

echo '\e[34mExecuting\e[0m "\e[32m~/dotfiles/scripts/repository-updates.zsh \e[35m~/external-software/\e[0m"'
~/dotfiles/scripts/repository-updates.zsh ~/external-repos/

echo '\e[34mExecuting\e[0m "\e[32msudo fwupdmgr \e[37mrefresh && \e[32msudo fwupdmgr \e[37mget-updates\e[0m"'
sudo fwupdmgr refresh && sudo fwupdmgr get-updates


echo 'To update zsh4humans'
echo 'zh4 update'

echo 'Install VSCode extension updates'
echo 'code --list-extensions | xargs -n 1 code --force --install-extension'

