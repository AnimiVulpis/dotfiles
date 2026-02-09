# Basis for this file is https://github.com/romkatv/zsh-bench/blob/master/configs/diy%2B%2B/skel/.zshrc

function zcompile-many() {
    local f
    for f; do zcompile -R -- "$f".zwc "$f"; done
}

# Clone and compile to wordcode missing plugins.
if [[ ! -e ~/external-repos/zsh-syntax-highlighting ]]; then
    git clone --depth=1 git@github.com:zsh-users/zsh-syntax-highlighting.git ~/external-repos/zsh-syntax-highlighting
    zcompile-many ~/external-repos/zsh-syntax-highlighting/{zsh-syntax-highlighting.zsh,highlighters/*/*.zsh}
fi
if [[ ! -e ~/external-repos/zsh-autosuggestions ]]; then
    git clone --depth=1 git@github.com:zsh-users/zsh-autosuggestions.git ~/external-repos/zsh-autosuggestions
    zcompile-many ~/external-repos/zsh-autosuggestions/{zsh-autosuggestions.zsh,src/**/*.zsh}
fi
if [[ ! -e ~/external-repos/zsh-completions ]]; then
    git clone --depth=1 git@github.com:zsh-users/zsh-completions.git ~/external-repos/zsh-completions
fi
if [[ ! -e ~/external-repos/powerlevel10k ]]; then
    git clone --depth=1 git@github.com:romkatv/powerlevel10k.git ~/external-repos/powerlevel10k
    make -C ~/external-repos/powerlevel10k pkg
fi
if [[ ! -e ~/external-repos/LS_COLORS ]]; then
    git clone --depth=1 git@github.com:trapd00r/LS_COLORS.git ~/external-repos/LS_COLORS
fi
if [[ ! -e ~/external-repos/zsh-nvm ]]; then
    git clone --depth=1 git@github.com:lukechilds/zsh-nvm.git ~/external-repos/zsh-nvm
    zcompile-many ~/external-repos/zsh-nvm/zsh-nvm.plugin.zsh
fi
if [[ ! -e ~/external-repos/ohmyzsh ]]; then
    git clone --depth=1 git@github.com:ohmyzsh/ohmyzsh.git ~/external-repos/ohmyzsh
    zcompile-many ~/external-repos/ohmyzsh/plugins/{sudo/sudo.plugin.zsh,dircycle/dircycle.plugin.zsh}
fi
if [[ ! -e ~/external-repos/zsh-edit ]]; then
    git clone --depth=1 git@github.com:marlonrichert/zsh-edit.git ~/external-repos/zsh-edit
    zcompile-many ~/external-repos/zsh-edit/zsh-edit.plugin.zsh
fi
if [[ ! -e ~/external-repos/atuin ]]; then
    git clone --depth=1 git@github.com:atuinsh/atuin.git ~/external-repos/atuin
    # See below for more information
    atuin init zsh > ~/external-repos/atuin/atuin.init.zsh
    zcompile-many ~/external-repos/atuin/atuin.init.zsh
fi
if [[ ! -e ~/dotfiles/scripts/set-terminal-title.zsh.zwc ]]; then
    zcompile-many ~/dotfiles/scripts/set-terminal-title.zsh
fi

# Activate Powerlevel10k Instant Prompt.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Load LS_COLORS earlier because those are also used by the completion system
source ~/external-repos/LS_COLORS/lscolors.sh

# Configure the completion system
# Directly taken from `zsh4humans` `fn/-z4h-init-zle`
zstyle ':completion:*'               matcher-list      "m:{[:lower:]}={[:upper:]}" \
    "+m:{[:upper:]}={[:lower:]}" \
    "+r:|[._-]=* r:|=*" "+l:|=* r:|=*"
# "" to make completion of the unambiguous part work while allowing menu completion with tab
zstyle ':completion:*'               menu              ""
zstyle ':completion:*'               verbose           "true"
zstyle ':completion:::::'            insert-tab        "pending"
zstyle ':completion:*:-subscript-:*' tag-order         "indexes parameters"
zstyle ':completion:*:-tilde-:*'     tag-order         "directory-stack" "named-directories" "users"
zstyle ':completion:*'               squeeze-slashes   "true"
zstyle ':completion:*:rm:*'          ignore-line       "other"
zstyle ':completion:*:kill:*'        ignore-line       "other"
zstyle ':completion:*:diff:*'        ignore-line       "other"
zstyle ':completion:*:rm:*'          file-patterns     "*:all-files"
zstyle ':completion:*:paths'         accept-exact-dirs "true"
zstyle ':completion:*'               single-ignored    "show"
zstyle ':completion:*:functions'     ignored-patterns  "-*|_*"
zstyle ':completion:*:parameters'    ignored-patterns  \
    "_(z4h|p9k|_p9k|POWERLEVEL9K|gitstatus|GITSTATUS|zsh_highlight|zsh_autosuggest|ZSH_HIGHLIGHT|ZSH_AUTOSUGGEST)*"

# With a sprinkle of `tips.md`
zstyle ':completion:*:ssh:argument-1:'       tag-order  hosts users
zstyle ':completion:*:scp:argument-rest:'    tag-order  hosts files users
zstyle ':completion:*:(ssh|scp|rdp):*:hosts' hosts

zstyle ':completion:*:git-*:argument-rest:heads'           ignored-patterns '(FETCH_|ORIG_|*/|)HEAD'
zstyle ':completion:*:git-*:argument-rest:heads-local'     ignored-patterns '(FETCH_|ORIG_|)HEAD'
zstyle ':completion:*:git-*:argument-rest:heads-remote'    ignored-patterns '*/HEAD'
zstyle ':completion:*:git-*:argument-rest:commits'         ignored-patterns '*'
zstyle ':completion:*:git-*:argument-rest:commit-objects'  ignored-patterns '*'
zstyle ':completion:*:git-*:argument-rest:recent-branches' ignored-patterns '*'

# Make it possible to use completion specifications and functions written for bash.
autoload -Uz bashcompinit
bashcompinit

# Add in some more magic from `fn/-z4h-compinit`
local -aU editors=(
    vi vim nvim emacs nano gedit hx code kak kate mcedit joe $EDITOR $VISUAL
    bat cat less more $PAGER)
zstyle ':completion:*:*:('${(j:|:)editors}'):*:*' ignored-patterns '*.zwc'

zstyle ':completion:*' list-colors "${(@s.:.)LS_COLORS}"

# Add zsh-completions to fpath
fpath=(~/external-repos/zsh-completions/src $fpath)

# Append other (manually created) completions to the fpath
fpath+=(~/completions)

# Autosuggestion configuration
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=244'
# ZSH_AUTOSUGGEST_MANUAL_REBIND=1

# ZSH-SYNTAX-HIGHLIGHTING configuration
ZSH_HIGHLIGHT_MAXLENGTH=1024                # don't colorize long command lines (slow)
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)  # main syntax highlighting plus matching brackets

# Changes the path where the applications will be moved by homebrew
export HOMEBREW_CASK_OPTS="--appdir=~/Applications"
# From `/opt/homebrew/bin/brew shellenv`
export HOMEBREW_PREFIX="/opt/homebrew"
export HOMEBREW_CELLAR="/opt/homebrew/Cellar"
export HOMEBREW_REPOSITORY="/opt/homebrew"
fpath[1,0]="/opt/homebrew/share/zsh/site-functions"
PATH="/Users/I526086/.local/share/../bin:/opt/homebrew/bin:/opt/homebrew/sbin:/Users/I526086/.cargo/bin:/usr/bin:/bin:/usr/sbin:/sbin"
export PATH
[ -z "${MANPATH-}" ] || export MANPATH=":${MANPATH#:}"
export INFOPATH="/opt/homebrew/share/info:${INFOPATH:-}"

# Configure fzf
# Add the 'export' statement below to your shell's configuration
# (e.g. ~/.bashrc, ~/.zshrc, or a custom file you load during shell startup)

# Root Loops (https://rootloops.sh?sugar=7&colors=9&sogginess=8&flavor=1&fruit=7&milk=1)
export FZF_DEFAULT_OPTS="  --color=fg:#8ae7f7,fg+:#6bdef1,bg:#05262c,bg+:#0c3e46 \
    --color=hl:#1faeae,hl+:#24c6c6,info:#c98b1a,marker:#67af34 \
    --color=prompt:#f75b72,spinner:#ca64f3,pointer:#ca64f3,header:#509af6 \
    --color=border:#196772,label:#36b3c6,query:#8ae7f7"

# Configure nvm
# Set up NVM directory
export NVM_DIR="${XDG_DATA_HOME:-$HOME/.local/share}/nvm"
# Lazy load nvm
export NVM_LAZY_LOAD=true
# Don't autoload nvm node
export NVM_NO_USE=true

# Defining go paths
export GOPATH="$HOME/go"
export GOBIN="$GOPATH/bin"
# Define libpq path (PostgreSQL executables without server)
export LIBPQ_BIN="/opt/homebrew/opt/libpq/bin"
# Extend PATH (including mise shims)
path=(~/bin $HOME/.local/share/mise/shims $path $GOBIN $LIBPQ_BIN ~/dotfiles/scripts /usr/local/bin /usr/local/go/bin)
# Ensure GPG works correctly
export GPG_TTY=$TTY

# Set up history
export HISTFILE="${XDG_DATA_HOME:-$HOME/.local/share}/zsh/history-file"
HISTSIZE=512000
SAVEHIST=256000
# Inform about potential history loss
HISTORY_FILE_LINES=$(wc -l $HISTFILE | cut -w -f2)
HISTORY_BACKUP_FOLDER="$HOME/projects/zsh-history-backup/"
HISTORY_BACKUP_FILE=$(eza "$HISTORY_BACKUP_FOLDER" | rg -e '^L(\d+)' -r '$1' | sort -nr | {echo -n L; head -n1})
HISTORY_BACKUP_LINES=$(echo "$HISTORY_BACKUP_FILE" | rg -e 'L(\d+)' -or '$1')
if (( ${HISTORY_FILE_LINES:-0} < ${HISTORY_BACKUP_LINES:-1} )); then
    echo "Backup at $HISTORY_BACKUP_FILE has more lines ($HISTORY_BACKUP_LINES) than history-file ($HISTORY_FILE_LINES)"
fi

# zsh-users/zsh-autosuggestions
# Set max buffer size
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=30
# Use async suggestions
ZSH_AUTOSUGGEST_USE_ASYNC=1

# Enable the "new" completion system (compsys).
autoload -Uz compinit && compinit
[[ ~/.zcompdump.zwc -nt ~/.zcompdump ]] || zcompile-many ~/.zcompdump
unfunction zcompile-many

# More environment variables
export WORDCHARS=''

export SUDO_EDITOR="hx"
export EDITOR="hx"
export VISUAL="code -w"
export LESS="-iRFXMx4"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export MANPAGER="less -R --use-color -Dd+r -Du+b"
export MANROFFOPT="-c"
export LC_CTYPE="en_US.UTF-8"

# Load plugins.
source ~/external-repos/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/external-repos/powerlevel10k/powerlevel10k.zsh-theme
source ~/external-repos/zsh-nvm/zsh-nvm.plugin.zsh
source ~/external-repos/ohmyzsh/plugins/sudo/sudo.plugin.zsh
source ~/external-repos/ohmyzsh/plugins/dircycle/dircycle.plugin.zsh
source ~/external-repos/zsh-edit/zsh-edit.plugin.zsh
source ~/dotfiles/scripts/set-terminal-title.zsh
source ~/.p10k.zsh
source <(fzf --zsh)
# source ~/external-repos/atuin/atuin.plugin.zsh # This just does `source<(atuin init zsh)`
# `atuin.init.zsh` is just `atuin init zsh > atuin.init.zsh` (`zcompile -R atuin.init.zsh` for performance)
source ~/external-repos/atuin/atuin.init.zsh
source ~/external-repos/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Redraw p10k prompt (correctly) (source: https://github.com/romkatv/powerlevel10k/issues/2048#issuecomment-1271186812)
function redraw-prompt() {
    local f
    for f in chpwd "${chpwd_functions[@]}" precmd "${precmd_functions[@]}"; do
        [[ "${+functions[$f]}" == 0 ]] || "$f" &>/dev/null || true
    done
    p10k display -r
}

# Define down arrow subfolder search
subfolder-search() {
    local dir
    dir=$(fd ${1:-.} --type dir --print0 --hidden --exclude .git --follow --max-depth 10 --color=always |
        fzf --height 40% --ansi --no-sort --reverse --no-multi --cycle --read0 --tiebreak=length,begin,index) &&
        cd -- "$dir"
    redraw-prompt
}
zle -N subfolder-search

function y() {
    local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
    yazi "$@" --cwd-file="$tmp"
    if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
        builtin cd -- "$cwd"
    fi
    rm -f -- "$tmp"
}

# Autoload functions.
# autoload -Uz zmv
autoload -Uz zmv edit-command-line
zle -N edit-command-line

# Define functions and completions.
function md() { [[ $# == 1 ]] && mkdir -p -- "$1" && cd -- "$1" }
compdef _directories md

# AnimiVulpis
# alias definitions
alias ls="ls --color=auto"
alias ll="ls --color=auto -lh"
alias lh="ls --color=auto -lhA"
alias es="eza --group-directories-first"
alias ed="eza -D"
alias el="eza -l --time-style=long-iso --group-directories-first"
alias eh="eza -la --time-style=long-iso --group-directories-first"
alias et="eza -T --group-directories-first"
alias isodatetime="echo -n 'ISO 8601 week: ' && date +'%Y-W%V' && echo -n 'ISO 8601 date: ' && date -Iseconds"
alias browsetldr="tldr --list | fzf --preview \"tldr {1} --color=always\" --preview-window=right,70% | xargs tldr"

# Add flags to existing aliases.
# alias ls="${aliases[ls]:-ls} -A"

# Setup zoxide
eval "$(zoxide init zsh)"

# Set shell options: http://zsh.sourceforge.net/Doc/Release/Options.html.
# no special treatment for filenames with a leading dot
setopt GLOB_DOTS
# use menu completion [...] by pressing the tab key repeatedly
setopt AUTO_MENU
# If command can’t be executed and is the name of a directory, perform the cd command to that directory
setopt AUTO_CD
# If a parameter is completed whose content is the name of a directory, then add a trailing slash instead of a space
setopt AUTO_PARAM_SLASH
# Make cd push the old directory onto the directory stack
setopt AUTO_PUSHD
# Output hexadecimal numbers in the standard C format
setopt C_BASES
# Treat the ‘#’, ‘~’ and ‘^’ characters as part of patterns for filename generation
setopt EXTENDED_GLOB
# Perform implicit tees or cats when multiple redirections are attempted
setopt MULTIOS
# Don't run all background jobs at a lower priority
setopt NO_BG_NICE
# Output flow control is disabled in the shell’s editor
setopt NO_FLOW_CONTROL
# Don't automatically remove slashes from completions
setopt NO_AUTO_REMOVE_SLASH
# When listing files that are possible completions, DON'T show the type of each file
setopt NO_LIST_TYPES
# Don't beep on error in ZLE
setopt NO_BEEP
# History with timestamps and elapsed time
setopt EXTENDED_HISTORY
# Append to history after commands have finished
setopt INC_APPEND_HISTORY_TIME
# First remove oldest duplicate history items
setopt HIST_EXPIRE_DUPS_FIRST
# Better performance for locking of history file
setopt HIST_FCNTL_LOCK
# Don't add the history item consecutively
setopt HIST_IGNORE_DUPS
# Don't add history items with leading space
setopt HIST_IGNORE_SPACE
# Remove spaces
setopt HIST_REDUCE_BLANKS
# Don't execute history item immediately
setopt HIST_VERIFY
# List jobs with pid
setopt LONG_LIST_JOBS
# Remove no match warning
setopt NONOMATCH
# Move cursor to end of completion
setopt ALWAYS_TO_END
# Attempt completion if mid-word
setopt COMPLETE_IN_WORD
# Allow comments in interactive shell
setopt INTERACTIVE_COMMENTS
# Don't push the same directory consecutively
setopt PUSHD_IGNORE_DUPS

# Key bindings
# zsh-menu "cycle" backwards (opposite of <tab>)
bindkey '^[[Z' reverse-menu-complete

# zsh-autosuggestions
bindkey '^ ' autosuggest-accept

bindkey '^x^e' edit-command-line
bindkey '÷' redo

# dircycle
bindkey '^[[1;2D' insert-cycledleft
bindkey '^[[1;2C' insert-cycledright
bindkey '^[[1;2A' insert-cycledup

# fzf-subfolder search
bindkey '^[[1;2B' subfolder-search

# Fix extra space in rprompt (https://github.com/romkatv/powerlevel10k?tab=readme-ov-file#extra-or-missing-spaces-in-prompt-compared-to-powerlevel9k)
ZLE_RPROMPT_INDENT=0
