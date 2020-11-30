#!/bin/zsh

set -e

# Tool to fetch gitignore files from GitHub templates `gig`
go get -v -u github.com/toshi0607/gig
# Tool to check the size of git repositories `git-sizer`
go get -v -u github.com/github/git-sizer
# Tool to manage hosts file idempotent `hostess`
go get -v -u github.com/cbednarski/hostess
# Tool for fast code search `houndd`
go get -v -u github.com/hound-search/hound/cmds/...
