#!/bin/zsh

# To profile zsh startup uncomment:
# zmodload zsh/zprof

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Set up history
export HISTFILE="${XDG_DATA_HOME:-$HOME/.local/share}/zsh/history-file"
HISTSIZE=512000
SAVEHIST=256000
# ZLE Emacs mode
bindkey -e

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

# Set max buffer size zsh-users/zsh-autosuggestions
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
# Use async suggestions
ZSH_AUTOSUGGEST_USE_ASYNC=1

# Set up NVM directory
export NVM_DIR="${XDG_DATA_HOME:-$HOME/.local/share}/nvm"
# Don't autoload nvm node
export NVM_NO_USE=true

# make `zle reset-prompt` work as described [here](https://github.com/zdharma-continuum/history-search-multi-word)
zstyle :plugin:history-search-multi-word reset-prompt-protect 1

# Set znap repository folder
zstyle ':znap:*' repos-dir ~/zsh-repos
source ~/zsh-snap/znap.zsh

# run this once on the command line to install via znap
# znap install ahmetb/kubectx
# znap install simonwhitaker/gibo

znap eval trapd00r/LS_COLORS 'dircolors -b LS_COLORS'
znap source romkatv/powerlevel10k
znap source lukechilds/zsh-nvm
znap source hcgraf/zsh-sudo
znap source ael-code/zsh-colored-man-pages
znap source b4b4r07/emoji-cli
znap source marlonrichert/zsh-edit
znap source zsh-users/zsh-autosuggestions
znap source AnimiVulpis/zsh-terminal-title
znap source zsh-users/zsh-completions
znap source zdharma-continuum/history-search-multi-word
znap source zdharma-continuum/fast-syntax-highlighting

source ~/dotfiles/scripts/fasd-init-cache.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# The following lines were added by compinstall (but modified)

zstyle ':completion:*' completer _list _expand _complete _ignored _match _approximate _prefix
zstyle ':completion:*' completions 1
zstyle ':completion:*' condition 7
zstyle ':completion:*' expand prefix suffix
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' glob 1
zstyle ':completion:*' ignore-parents parent pwd .. directory
zstyle ':completion:*' insert-unambiguous false
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-prompt '%SAt %p (of %l): Hit TAB for more, or type%s'
zstyle ':completion:*' list-suffixes true
zstyle ':completion:*' matcher-list '' 'm:{[:lower:]}={[:upper:]}' 'r:|[._-/]=** r:|=**' '+m:{[:lower:]}={[:upper:]}'
zstyle ':completion:*' match-original both
zstyle ':completion:*' max-errors 2
zstyle ':completion:*' menu select=1
zstyle ':completion:*' original false
zstyle ':completion:*' preserve-prefix '//[^/]##/'
zstyle ':completion:*' select-prompt '%SAt %l (%p)%s'
zstyle ':completion:*' substitute 1
zstyle ':completion:*' use-compctl true
zstyle ':completion:*' verbose true

# autoload -Uz compinit
# compinit
# End of lines added by compinstall (but modified)

# Use CTRL+(hjkl) besides cursor keys in menu completion
zmodload zsh/complist
bindkey -M menuselect '^h' vi-backward-char        # left
bindkey -M menuselect '^k' vi-up-line-or-history   # up
bindkey -M menuselect '^l' vi-forward-char         # right
bindkey -M menuselect '^j' vi-down-line-or-history # bottom

# Bind <shift-tab> to go **backwards** in selection list
bindkey -M menuselect '^\[[Z' reverse-menu-complete

# Set key-binding https://github.com/zsh-users/zsh-autosuggestions#key-bindings
bindkey '^ ' autosuggest-accept

export WORDCHARS=''

# Defining go paths
export GOPATH="$HOME/go"
export GOBIN="$GOPATH/bin"

# Configure docker to use XDG_CONFIG_DIR
export DOCKER_CONFIG="${XDG_CONFIG_HOME:-$HOME/.config}/docker"

# alias definitions
alias ls="ls --color=auto"
alias ll="ls --color=auto -lh"
alias lh="ls --color=auto -lhA"
alias es="exa"
alias ed="exa -D"
alias el="exa -l --time-style=long-iso"
alias eh="exa -la --time-style=long-iso"
alias et="exa -T"
alias tv="tidy-viewer"
alias isodatetime="echo -n 'ISO 8601 week:\t' && date +'%Y-W%V' && echo -n 'ISO 8601 date:\t' && date -Iseconds"

# More environment variables
export SUDO_EDITOR="vim"
export EDITOR="vim"
export VISUAL="code -w"
export LESS="-x4 -Ri"

# broot initialization
source "${XDG_CONFIG_HOME:-$HOME/.config}/broot/launcher/bash/br"
