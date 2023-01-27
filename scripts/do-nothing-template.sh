#!/bin/bash

read -n 1 -s -r -p "Press any key to continue..."; echo
# -n ## defines the required character count to stop reading
# -s hides the user's input
# -r causes the string to be interpreted "raw" (without considering backslash escapes)
echo "Any key pressed"

read -n 1 -s -r -p "Press any key to continue..." pressedKey; echo

echo "'$pressedKey' pressed" 
