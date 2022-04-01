#!/bin/bash

history_location="$HOME/.local/share/zsh/history-file"
lines_in_history=$(wc -l $history_location | cut -d ' ' -f 1)

backup_folder="$HOME/projects/zsh-history-backup/"
lines_in_latest_backup=$(ls -r $backup_folder | head -n 1 | cut -d 'L' -f 2)

echo "Currently $lines_in_history lines in $history_location"
echo "Latest backup has $lines_in_latest_backup lines"

cp -v $history_location $backup_folder$(date -Im)_histfile_L$lines_in_history
