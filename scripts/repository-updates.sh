#!/bin/zsh

# Check if first argument is a valid directory
if [ ! -d "$1" ]; then
    echo "$1 is not valid directory"
    exit 0
fi

# Fetch updates and print errors
exa -D $1 |
    xargs -I@ zsh -c "
    echo -ne '\033[2K Fetching @\r';
    git -C $1/@ fetch -q origin || echo -e ' Fetching @ \033[0;31mfailed\033[0m (See above for error)'"

# Pretty-print tracking information
exa -D $1 |
    xargs -I@ zsh -c "
    echo -n '@\t';
    git -c color.status=always -C $1/@ status --untracked-files=no --short --branch" 2>&1 |
    column --table --separator '	'
