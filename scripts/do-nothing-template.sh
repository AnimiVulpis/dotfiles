#!/usr/bin/env bash
set -e # Exit if a command exits with a non-zero status
set -u # Treat unset variables as an error
set -o pipefail # Treat any non-zero status in a pipeline like a total pipeline failure
shopt -s inherit_errexit # Command substitutions inherit set -e from the parent script

read -n 1 -s -r -p "Press any key to continue..."; echo
# -n ## defines the required character count to stop reading
# -s hides the user's input
# -r causes the string to be interpreted "raw" (without considering backslash escapes)
echo "Any key pressed"

read -n 1 -s -r -p "Press any key to continue..." pressedKey; echo

echo "'$pressedKey' pressed" 
