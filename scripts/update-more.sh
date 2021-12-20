#!/bin/sh

# Rust related
echo '\e[34mExecuting\e[0m "\e[32mrustup \e[37mupdate\e[0m"'
rustup update

# List all installed rust crates
# cargo install --list

echo '\e[34mExecuting\e[0m "\e[32mcargo \e[37minstall bat broot click eva exa fd-find find_unicode genact git-delta hyperfine ncspot swaysome sworkstyle tidy-viewer workstyle \e[0m"'
cargo install \
    bat \
    broot \
    click \
    eva \
    exa \
    fd-find \
    find_unicode \
    genact \
    git-delta \
    hyperfine \
    ncspot \
    swaysome \
    sworkstyle \
    tidy-viewer \
    workstyle
cargo install --version 0.1.0-alpha.5 gobang

# Go related

# List all installed go packages
# go list ...

# Credential helper for docker to access Amazon ECR
echo '\e[34mExecuting\e[0m "\e[32mgo \e[37mgithub.com/awslabs/amazon-ecr-credential-helper/ecr-login/cli/docker-credential-ecr-login@latest\e[0m"'
go install github.com/awslabs/amazon-ecr-credential-helper/ecr-login/cli/docker-credential-ecr-login@latest
# Tool to fetch gitignore files from GitHub templates `gig`
echo '\e[34mExecuting\e[0m "\e[32mgo \e[37minstall github.com/toshi0607/gig@latest\e[0m"'
go install github.com/toshi0607/gig@latest
# Tool to check the size of git repositories `git-sizer`
echo '\e[34mExecuting\e[0m "\e[32mgo \e[37minstall github.com/github/git-sizer@latest\e[0m"'
go install github.com/github/git-sizer@latest
# Tool to manage hosts file idempotent `hostess`
echo '\e[34mExecuting\e[0m "\e[32mgo \e[37minstall github.com/cbednarski/hostess@latest\e[0m"'
go install github.com/cbednarski/hostess@latest
# Tool for fast code search `houndd`
echo '\e[34mExecuting\e[0m "\e[32mgo \e[37minstall github.com/hound-search/hound/cmds/...@latest\e[0m"'
go install github.com/hound-search/hound/cmds/...@latest

# Python related

echo '\e[34mCheck\e[0m "\e[32mhttps://github.com/fdw/rofimoji/releases/\e[0m" for \e[33mrofimoji\e[0m \e[35m> 5.3.0\e[0m'
echo '\e[34mThen use\e[0m `\e[32mpip3 \e[33minstall \e[36m--user \e[35m~/Downloads/rofimoji-<VERSION>-py3-none-any.whl\e[0m` \e[34mto install\e[0m'
