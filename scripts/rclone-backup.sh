#!/usr/bin/env bash
set -e                   # Exit if a command exits with a non-zero status
set -u                   # Treat unset variables as an error
set -o pipefail          # Treat any non-zero status in a pipeline like a total pipeline failure
shopt -s inherit_errexit # Command substitutions inherit set -e from the parent script

echo 'rclone --progress --human-readable -v bisync ~/rclone/ gdrive:rclone/'
rclone --progress --human-readable -v bisync ~/rclone/ gdrive:rclone/
