#!/bin/zsh

# Check if first argument is a valid directory
if [ ! -d "$1" ]; then
    echo "$1 is not valid directory"
    exit 0
fi

# Hide cursor
echo -ne '\e[?25l'

# Fetch updates and print errors
exa -D $1 \
    | xargs -I@ zsh -c "
    echo -ne '\e[2KFetching @\r';
    git -C $1/@ fetch -q origin || echo -e 'Fetching @ \e[0;31mfailed\e[0m (See above for error)'"

# Pretty-print tracking information
exa -D $1 \
    | xargs -I@ zsh -c "
    echo -n '@\t';
    git -c color.status=always -C $1/@ status --untracked-files=no --short --branch" 2>&1 \
    | column --table --separator '	'

# Show cursor again
echo -ne '\e[?25h'
