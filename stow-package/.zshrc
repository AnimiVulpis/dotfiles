# Personal Zsh configuration file. It is strongly recommended to keep all
# shell customization and configuration (including exported environment
# variables such as PATH) in this file or in files sourced from it.
#
# Documentation: https://github.com/romkatv/zsh4humans/blob/v5/README.md.

# Periodic auto-update on Zsh startup: 'ask' or 'no'.
# You can manually run `z4h update` to update everything.
zstyle ':z4h:' auto-update      'no'
# Ask whether to auto-update this often; has no effect if auto-update is 'no'.
zstyle ':z4h:' auto-update-days '28'

# Keyboard type: 'mac' or 'pc'.
zstyle ':z4h:bindkey' keyboard  'mac'

# Don't start tmux.
zstyle ':z4h:' start-tmux       no

# Mark up shell's output with semantic information.
zstyle ':z4h:' term-shell-integration 'yes'

# Right-arrow key accepts one character ('partial-accept') from
# command autosuggestions or the whole thing ('accept')?
zstyle ':z4h:autosuggestions' forward-char 'accept'

# Recursively traverse directories when TAB-completing files.
zstyle ':z4h:fzf-complete' recurse-dirs 'yes'

# AnimiVulpis as per https://github.com/romkatv/zsh4humans/blob/v5/tips.md#completions
zstyle ':z4h:fzf-complete' fzf-bindings tab:repeat

# AnimiVulpis as per https://github.com/romkatv/zsh4humans/blob/master/tips.md#current-directory
zstyle ':z4h:fzf-dir-history' fzf-bindings tab:repeat
zstyle ':z4h:cd-down'         fzf-bindings tab:repeat

# Enable direnv to automatically source .envrc files.
zstyle ':z4h:direnv'         enable 'no'
# Show "loading" and "unloading" notifications from direnv.
zstyle ':z4h:direnv:success' notify 'yes'

# Enable ('yes') or disable ('no') automatic teleportation of z4h over
# SSH when connecting to these hosts.
zstyle ':z4h:ssh:example-hostname1'   enable 'yes'
zstyle ':z4h:ssh:*.example-hostname2' enable 'no'
# The default value if none of the overrides above match the hostname.
zstyle ':z4h:ssh:*'                   enable 'no'

# Send these files over to the remote host when connecting over SSH to the
# enabled hosts.
# zstyle ':z4h:ssh:*' send-extra-files '~/.nanorc' '~/.env.zsh'
# AnimiVulpis
zstyle ':z4h:ssh:*' send-extra-files '~/.env.zsh'

# AnimiVulpis
# Terminal title
zstyle ':z4h:term-title:ssh'   preexec '%n@${${${Z4H_SSH##*:}//\%/%%}:-%m}: %~ » ${1//\%/%%}'
zstyle ':z4h:term-title:ssh'   precmd  '%n@${${${Z4H_SSH##*:}//\%/%%}:-%m}: %~'
zstyle ':z4h:term-title:local' preexec '%~ » ${1//\%/%%}'
zstyle ':z4h:term-title:local' precmd  '%~'

# Clone additional Git repositories from GitHub.
#
# This doesn't do anything apart from cloning the repository and keeping it
# up-to-date. Cloned files can be used after `z4h init`. This is just an
# example. If you don't plan to use Oh My Zsh, delete this line.
z4h install ohmyzsh/ohmyzsh || return
# AnimiVulpis
# nvm
z4h install trapd00r/LS_COLORS || return
z4h install lukechilds/zsh-nvm || return
z4h install ael-code/zsh-colored-man-pages || return
z4h install marlonrichert/zsh-edit || return

# Install or update core components (fzf, zsh-autosuggestions, etc.) and
# initialize Zsh. After this point console I/O is unavailable until Zsh
# is fully initialized. Everything that requires user interaction or can
# perform network I/O must be done above. Everything else is best done below.
z4h init || return

# AnimiVulpis
# Defining go paths
export GOPATH="$HOME/go"
export GOBIN="$GOPATH/bin"
# Extend PATH.
path=(~/bin $path $GOBIN ~/dotfiles/scripts)

# Export environment variables.
export GPG_TTY=$TTY

# AnimiVulpis
# Set up history
export HISTFILE="${XDG_DATA_HOME:-$HOME/.local/share}/zsh/history-file"
HISTSIZE=512000
SAVEHIST=256000
# Inform about potential history loss
HISTORY_FILE_LINES=$(wc -l $HISTFILE | cut -w -f2)
HISTORY_BACKUP_FOLDER="$HOME/projects/zsh-history-backup/"
HISTORY_BACKUP_FILE=$(eza "$HISTORY_BACKUP_FOLDER" | rg -e '^L(\d+)' | sort -nr | head -n 1)
HISTORY_BACKUP_LINES=$(echo "$HISTORY_BACKUP_FILE" | rg -e 'L(\d+)' -or '$1')
if (( ${HISTORY_FILE_LINES:-0} < ${HISTORY_BACKUP_LINES:-1} )); then
    echo "Backup at $HISTORY_BACKUP_FILE has more lines ($HISTORY_BACKUP_LINES) than history-file ($HISTORY_FILE_LINES)"
fi
# nvm
# Set up NVM directory
export NVM_DIR="${XDG_DATA_HOME:-$HOME/.local/share}/nvm"
# Don't autoload nvm node
export NVM_NO_USE=true
# zsh-users/zsh-autosuggestions
# Set max buffer size
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
# Use async suggestions
ZSH_AUTOSUGGEST_USE_ASYNC=1
# More environment variables
export SUDO_EDITOR="hx"
export EDITOR="hx"
export VISUAL="code -w"
export LESS="-x4 -Ri"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export LC_CTYPE="en_US.UTF-8"

# Source additional local files if they exist.
z4h source ~/.env.zsh

# Use additional Git repositories pulled in with `z4h install`.
#
# This is just an example that you should delete. It does nothing useful.
# z4h source ohmyzsh/ohmyzsh/lib/diagnostics.zsh  # source an individual file
# z4h load   ohmyzsh/ohmyzsh/plugins/emoji-clock  # load a plugin
# AnimiVulpis
z4h source trapd00r/LS_COLORS/lscolors.sh
z4h load lukechilds/zsh-nvm
z4h load ohmyzsh/ohmyzsh/plugins/sudo
z4h load ohmyzsh/ohmyzsh/plugins/asdf
z4h load ael-code/zsh-colored-man-pages
z4h load marlonrichert/zsh-edit

# Define key bindings.
z4h bindkey z4h-backward-kill-word  Ctrl+Backspace     Ctrl+H
z4h bindkey z4h-backward-kill-zword Ctrl+Alt+Backspace

z4h bindkey undo Ctrl+/   Shift+Tab  # undo the last command line change
z4h bindkey redo Option+/            # redo the last undone command line change

z4h bindkey z4h-cd-back    Shift+Left   # cd into the previous directory
z4h bindkey z4h-cd-forward Shift+Right  # cd into the next directory
z4h bindkey z4h-cd-up      Shift+Up     # cd into the parent directory
z4h bindkey z4h-cd-down    Shift+Down   # cd into a child directory
# AnimiVulpis
z4h bindkey autosuggest-accept Ctrl+Space
bindkey '^x^e' edit-command-line

# Autoload functions.
# autoload -Uz zmv
# AnimiVulpis
autoload -Uz zmv edit-command-line
zle -N edit-command-line

# Define functions and completions.
# function md() { [[ $# == 1 ]] && mkdir -p -- "$1" && cd -- "$1" }
# compdef _directories md

# Define named directories: ~w <=> Windows home directory on WSL.
# [[ -z $z4h_win_home ]] || hash -d w=$z4h_win_home

# Define aliases.
alias tree='tree -a -I .git'
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
alias tv="tidy-viewer"
alias isodatetime="echo -n 'ISO 8601 week: ' && date +'%Y-W%V' && echo -n 'ISO 8601 date: ' && date -Iseconds"

# Add flags to existing aliases.
alias ls="${aliases[ls]:-ls} -A"

# Setup zoxide
eval "$(zoxide init zsh)"

# Set shell options: http://zsh.sourceforge.net/Doc/Release/Options.html.
setopt glob_dots     # no special treatment for file names with a leading dot
setopt no_auto_menu  # require an extra TAB press to open the completion menu

# AnimiVulpis
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
