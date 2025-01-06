#!/usr/bin/env bash
set -e                   # Exit if a command exits with a non-zero status
set -u                   # Treat unset variables as an error
set -o pipefail          # Treat any non-zero status in a pipeline like a total pipeline failure
shopt -s inherit_errexit # Command substitutions inherit set -e from the parent script

sd ":\*LS_COLORS=48;5;89;38;5;197;1;3;4;7:" ":*LS_COLORS=48;5;89;38;5;9;1;3;4;7:" "$1"
sd ":no=0:" ":no=38;5;248:" "$1"
