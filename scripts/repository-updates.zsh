#!/bin/bash

# Check if first argument is a valid directory
if [ ! -d "$1" ]; then
    echo "$1 is not valid directory"
    exit 0
fi

# Hide cursor
echo -ne '\e[?25l'
# Show cursor when exiting with CTRL+C
trap "echo -e '\e[?25h'" SIGINT

# Fetch updates and print potential errors
exa -D $1 \
    | xargs -I@ bash -c "\
        echo -ne \"\e[34mFetching\e[0m @\e[30G\";\
        error_message=\$(git -C $1/@ fetch -q origin 2>&1)\
            && echo -ne '\e[32mOK\e[0m\e[35G';\
                git -c color.status=always -C $1/@ status --untracked-files=no --short --branch | head -n1 \
            || echo -e \"\e[31mFAILED\e[0m\n\$error_message\"\
    "

# Pretty-print tracking information (summary)
# exa -D $1 \
#     | xargs -I@ zsh -c "
#     echo -n '@\t';
#     git -c color.status=always -C $1/@ status --untracked-files=no --short --branch | head -n1" 2>&1 \
#     | column -t -s '	'

# Show cursor again
echo -ne '\e[?25h'
