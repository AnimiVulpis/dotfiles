# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=63000
SAVEHIST=42000
bindkey -e
# End of lines configured by zsh-newuser-install

# AnimiVulpis: Options for zsh
setopt APPEND_HISTORY
# History with timestamps and elapsed time
setopt EXTENDED_HISTORY
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

# AnimiVulpis: Set max buffer size https://github.com/zsh-users/zsh-autosuggestions#disabling-suggestion-for-large-buffers
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
# Use async suggestions
ZSH_AUTOSUGGEST_USE_ASYNC=1

# AnimiVulpis: zplug related
export ZPLUG_HOME="$XDG_CONFIG_HOME/zplug"
export ZPLUG_CACHE_DIR="$XDG_CACHE_HOME/zplug"
source $ZPLUG_HOME/init.zsh
# AnimiVulpis: zplug self-manage
zplug 'zplug/zplug', hook-build:'zplug --self-manage'
# AnimiVulpis: zsh plugins
# Define solarized LS_COLORS
zplug "joel-porquet/zsh-dircolors-solarized"
# Colored man pages
zplug "ael-code/zsh-colored-man-pages"
# Toggles "sudo" before the current/previous command by pressing [ESC][ESC]
zplug "hcgraf/zsh-sudo"
# More completions
zplug "zsh-users/zsh-completions"
# Fish-like autosuggestions for zsh
zplug "zsh-users/zsh-autosuggestions"
# Fast syntax highlighting
zplug "zdharma/fast-syntax-highlighting", defer:2
# [UP][DOWN] history search feature
zplug "zsh-users/zsh-history-substring-search", defer:3
# History search multi-word
zplug "zdharma/history-search-multi-word"
# Theme loading
zplug "~/dotfiles", use:"arch-zsh/animivulpis.zsh-theme", as:theme
# Completion configuration
zplug "~/dotfiles", use:"arch-zsh/completion.zsh", from:local, defer:0
# AnimiVulpis: load zplug
zplug load

# The following lines were added by compinstall
# zstyle :compinstall filename '/home/animi_vulpis/.zshrc'

# autoload -Uz compinit
# compinit
# End of lines added by compinstall

# AnimiVulpis: Set key-binding https://github.com/zsh-users/zsh-autosuggestions#key-bindings
bindkey '^ ' autosuggest-accept

# History substring search config
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# AnimiVulpis: Defining go paths
export GOPATH="$HOME/go"
export GOBIN="$GOPATH/bin"

# AnimiVulpis: PATH modification for cargo/go
export PATH="$HOME/.cargo/bin:$GOBIN:$PATH"

# AnimiVulpis: alias definitions
alias vi="nvim"
alias vim="nvim"
alias ls="ls --color=auto"
alias ll="ls --color=auto -lh"
alias lh="ls --color=auto -lhA"
alias es="exa"
alias el="exa -l --time-style=long-iso"
alias eh="exa -la --time-style=long-iso"
alias et="exa -T"

# AnimiVulpis: More environment variables
export EDITOR="nvim"
export VISUAL="code -w"
export LESS="-x4 -Ri"

# AnimiVulpis: fasd initialization
eval "$(fasd --init auto)"

# AnimiVulpis: nvm initialization
export NVM_DIR="$XDG_CONFIG_HOME/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" --no-use

# AnimiVulpis: broot initialization
source /home/animi_vulpis/.config/broot/launcher/bash/br
