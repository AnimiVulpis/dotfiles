#!/usr/bin/env bash
set -e # Exit if a command exits with a non-zero status
set -u # Treat unset variables as an error
set -o pipefail # Treat any non-zero status in a pipeline like a total pipeline failure
shopt -s inherit_errexit # Command substitutions inherit set -e from the parent script

echo Execute the following line to check for updates
echo "nvm ls-remote --lts | rg --multiline --colors=match:none -e '(:?.*\n){0,3}.*Latest ' && nvm ls-remote | tail -n 3"
