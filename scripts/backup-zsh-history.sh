#!/bin/bash

history_location="$HOME/.local/share/zsh/history-file"

lines_in_history=$(wc -l $history_location | cut -d ' ' -f 1)

echo "Currently $lines_in_history lines in $history_location"

cp -v $history_location ~/projects/zsh-history-backup/$(date -Im)-$lines_in_history-histfile
