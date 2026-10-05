#!/usr/bin/env bash
set -e                   # Exit if a command exits with a non-zero status
set -u                   # Treat unset variables as an error
set -o pipefail          # Treat any non-zero status in a pipeline like a total pipeline failure
shopt -s inherit_errexit # Command substitutions inherit set -e from the parent script

# Until I have my self hosted atuin database running
echo 'cp -pv "$HOME/.local/share/atuin/history."* "$HOME/rclone/"'
cp -pv "$HOME/.local/share/atuin/history."* "$HOME/rclone/"
