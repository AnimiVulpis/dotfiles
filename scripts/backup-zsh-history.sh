#!/usr/bin/env bash
set -e                   # Exit if a command exits with a non-zero status
set -u                   # Treat unset variables as an error
set -o pipefail          # Treat any non-zero status in a pipeline like a total pipeline failure
shopt -s inherit_errexit # Command substitutions inherit set -e from the parent script

interactive=false

while getopts ":i" opt; do
    case ${opt} in
    i)
        interactive=true
        ;;
    ?)
        echo "Invalid option: -${OPTARG}"
        exit 1
        ;;
    esac
done

backup_zsh_history() {
    local history_location
    local lines_in_history
    local backup_folder
    local latest_backup
    local lines_in_latest_backup
    local lines_in_largest_backup
    local largest_backup
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
}

# Until I have my self hosted atuin database running
echo 'cp -pv ~/.local/share/atuin/history.db ~/rclone/'
cp -pv ~/.local/share/atuin/history.db ~/rclone/

if $interactive; then
    read -n 1 -s -r -p "abort, skip, or continue backup-zsh-history? [a/s/c]: " choice
    case $choice in
    a)
        echo "Aborting..."
        exit 1
        ;;
    s)
        echo "Skipping..."
        exit 0
        ;;
    c)
        echo
        backup_zsh_history
        ;;
    *)
        echo "Invalid choice. Aborting..."
        exit 1
        ;;
    esac
else
    backup_zsh_history
fi
