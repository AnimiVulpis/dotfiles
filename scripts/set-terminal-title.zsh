#!/usr/bin/env zsh

# Heavily inspired by https://github.com/romkatv/zsh4humans/blob/v5/fn/-z4h-set-term-title

function set-terminal-title() {
    emulate -L zsh -o no_prompt_bang -o prompt_subst -o prompt_percent

    local title=$1
    shift
    print -Prnv title -- $title
    printf -v title '\e]0;%s\a' "${(V)title}"

    if [[ -t 1 ]]; then
        print -rn -- $title
    elif [[ -w $TTY ]]; then
        print -rn -- $title >$TTY
    fi
}

# When a command is running, display it in the terminal title.
function set-terminal-title-preexec() {
    emulate -L zsh
    local _terminal_title
    if [[ -n $SSH_CONNECTION || $P9K_SSH == 1 ]]; then
        _terminal_title='%n@${${${Z4H_SSH##*:}//\%/%%}:-%m}: %~ » ${1//\%/%%}'
    else
        _terminal_title='%~ » ${1//\%/%%}'
    fi
    [[ -z $_terminal_title ]] || set-terminal-title $_terminal_title "$@"
}

# When no command is running, display the current directory in the terminal title.
function set-terminal-title-precmd() {
    local -i err=$?
    emulate -L zsh
    local _terminal_title
    if [[ -n $SSH_CONNECTION || $P9K_SSH == 1 ]]; then
        _terminal_title='%n@${${${Z4H_SSH##*:}//\%/%%}:-%m}: %~'
    else
       _terminal_title='%~'
    fi
    [[ -z $_terminal_title ]] || set-terminal-title $_terminal_title
}

autoload -Uz add-zsh-hook
add-zsh-hook -- preexec set-terminal-title-preexec || return
add-zsh-hook -- precmd set-terminal-title-precmd || return
