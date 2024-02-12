#!/usr/bin/env bash
set -e # Exit if a command exits with a non-zero status
set -u # Treat unset variables as an error
set -o pipefail # Treat any non-zero status in a pipeline like a total pipeline failure
shopt -s inherit_errexit # Command substitutions inherit set -e from the parent script

history_location="$HOME/.local/share/zsh/history-file"
lines_in_history=$(wc -l "$history_location" | cut -w -f 2)

backup_folder="$HOME/projects/zsh-history-backup/"

latest_backup=$(eza "$backup_folder" -rs newest | head -n 1)
lines_in_latest_backup=$(echo "$latest_backup" | rg -e 'L(\d+)' -or '$1')

lines_in_largest_backup=$(eza "$backup_folder" | rg -e 'L(\d+)' -or '$1' | sort -nr | head -n 1)
largest_backup=$(eza "$backup_folder" | rg -e "L$lines_in_largest_backup")

echo "$lines_in_history lines currently in $history_location"
echo "$lines_in_latest_backup lines in  latest backup ($latest_backup)"
echo "$lines_in_largest_backup lines in largest backup ($largest_backup)"

cp -v "$history_location" "$backup_folder"L"$lines_in_history"_histfile_"$(date -Iminutes)"

cp -pfv "$history_location" ~/rclone/
