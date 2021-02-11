#!/bin/zsh

# Rust related
echo '\e[34mExecuting\e[0m "\e[32mrustup \e[37mupdate\e[0m"'
rustup update

echo '\e[34mExecuting\e[0m "\e[32mcargo \e[37minstall click eva genact\e[0m"'
cargo install chars click eva genact

# Go related
# Tool to fetch gitignore files from GitHub templates `gig`
echo '\e[34mExecuting\e[0m "\e[32mgo \e[37mget \e[36m-v -u \e[37mgithub.com/toshi0607/gig\e[0m"'
go get -v -u github.com/toshi0607/gig
# Tool to check the size of git repositories `git-sizer`
echo '\e[34mExecuting\e[0m "\e[32mgo \e[37mget \e[36m-v -u \e[37mgithub.com/github/git-sizer\e[0m"'
go get -v -u github.com/github/git-sizer
# Tool to manage hosts file idempotent `hostess`
echo '\e[34mExecuting\e[0m "\e[32mgo \e[37mget \e[36m-v -u \e[37mgithub.com/cbednarski/hostess\e[0m"'
go get -v -u github.com/cbednarski/hostess
# Tool for fast code search `houndd`
echo '\e[34mExecuting\e[0m "\e[32mgo \e[37mget \e[36m-v -u \e[37mgithub.com/hound-search/hound/cmds/...\e[0m"'
go get -v -u github.com/hound-search/hound/cmds/...
