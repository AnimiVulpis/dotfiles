#!/usr/bin/env bash
set -e                   # Exit if a command exits with a non-zero status
set -u                   # Treat unset variables as an error
set -o pipefail          # Treat any non-zero status in a pipeline like a total pipeline failure
shopt -s inherit_errexit # Command substitutions inherit set -e from the parent script

sd ":\*LS_COLORS=48;5;89;38;5;197;1;3;4;7:" ":*LS_COLORS=48;5;89;38;5;9;1;3;4;7:" "$1"
sd ":no=0:" ":no=38;5;248:" "$1"

# I used this to alter the default colors supplied by https://github.com/trapd00r/LS_COLORS
# by running `change-some-colors.sh lscolors.sh #lscolors` inside that repo
