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
    zcompile-many ~/external-repos/ohmyzsh/plugins/{sudo/sudo.plugin.zsh,asdf/asdf.plugin.zsh,dircycle/dircycle.plugin.zsh}
fi
if [[ ! -e ~/external-repos/zsh-edit ]]; then
    git clone --depth=1 git@github.com:marlonrichert/zsh-edit.git ~/external-repos/zsh-edit
    zcompile-many ~/external-repos/zsh-edit/zsh-edit.plugin.zsh
fi
if [[ ! -e ~/external-repos/atuin ]]; then
    git clone --depth=1 git@github.com:atuinsh/atuin.git ~/external-repos/atuin
    zcompile-many ~/external-repos/atuin/atuin.plugin.zsh
fi

# Activate Powerlevel10k Instant Prompt.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Enable the "new" completion system (compsys).
autoload -Uz compinit && compinit
[[ ~/.zcompdump.zwc -nt ~/.zcompdump ]] || zcompile-many ~/.zcompdump
unfunction zcompile-many

ZSH_AUTOSUGGEST_MANUAL_REBIND=1

# From `/opt/homebrew/bin/brew shellenv`
export HOMEBREW_PREFIX="/opt/homebrew";
export HOMEBREW_CELLAR="/opt/homebrew/Cellar";
export HOMEBREW_REPOSITORY="/opt/homebrew";
fpath[1,0]="/opt/homebrew/share/zsh/site-functions";
PATH="/opt/homebrew/bin:/opt/homebrew/sbin:/Users/I526086/.cargo/bin:/usr/bin:/bin:/usr/sbin:/sbin"; export PATH;
[ -z "${MANPATH-}" ] || export MANPATH=":${MANPATH#:}";
export INFOPATH="/opt/homebrew/share/info:${INFOPATH:-}";



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
# Extend PATH.
path=(~/bin $path $GOBIN $LIBPQ_BIN ~/dotfiles/scripts /usr/local/bin /usr/local/go/bin)
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
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
# Use async suggestions
ZSH_AUTOSUGGEST_USE_ASYNC=1

# More environment variables
export WORDCHARS=''

export SUDO_EDITOR="hx"
export EDITOR="hx"
export VISUAL="code -w"
export LESS="-x4 -Ri"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export MANPAGER="less -R --use-color -Dd+r -Du+b"
export MANROFFOPT="-c"
export LC_CTYPE="en_US.UTF-8"

# Load plugins.
source ~/external-repos/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/external-repos/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/external-repos/powerlevel10k/powerlevel10k.zsh-theme
source ~/external-repos/LS_COLORS/lscolors.sh
source ~/external-repos/zsh-nvm/zsh-nvm.plugin.zsh
source ~/external-repos/ohmyzsh/plugins/sudo/sudo.plugin.zsh
source ~/external-repos/ohmyzsh/plugins/asdf/asdf.plugin.zsh
source ~/external-repos/ohmyzsh/plugins/dircycle/dircycle.plugin.zsh
source ~/external-repos/zsh-edit/zsh-edit.plugin.zsh
source ~/.p10k.zsh
source <(fzf --zsh)
source ~/external-repos/atuin/atuin.plugin.zsh

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

# Autoload functions.
# autoload -Uz zmv
autoload -Uz zmv edit-command-line
zle -N edit-command-line

# Define functions and completions.
function md() { [[ $# == 1 ]] && mkdir -p -- "$1" && cd -- "$1" }
compdef _directories md

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
alias isodatetime="echo -n 'ISO 8601 week: ' && date +'%Y-W%V' && echo -n 'ISO 8601 date: ' && date -Iseconds"

# Add flags to existing aliases.
alias ls="${aliases[ls]:-ls} -A"

# Setup zoxide
eval "$(zoxide init zsh)"

# Set shell options: http://zsh.sourceforge.net/Doc/Release/Options.html.
setopt glob_dots     # no special treatment for file names with a leading dot
setopt no_auto_menu  # require an extra TAB press to open the completion menu

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
# zsh-autosuggestions
bindkey '^ ' autosuggest-accept

bindkey '^x^e' edit-command-line
bindkey '÷' redo

# dircylce
bindkey '^[[1;2D' insert-cycledleft
bindkey '^[[1;2C' insert-cycledright
bindkey '^[[1;2A' insert-cycledup

# fzf-subfolder search
bindkey '^[[1;2B' subfolder-search

# Terminal title fehlt

# AnimiVulpis
# Terminal title
# This needs re-doing
# zstyle ':z4h:term-title:ssh'   preexec '%n@${${${Z4H_SSH##*:}//\%/%%}:-%m}: %~ » ${1//\%/%%}'
# zstyle ':z4h:term-title:ssh'   precmd  '%n@${${${Z4H_SSH##*:}//\%/%%}:-%m}: %~'
# zstyle ':z4h:term-title:local' preexec '%~ » ${1//\%/%%}'
# zstyle ':z4h:term-title:local' precmd  '%~'

# Fix extra space in rprompt (https://github.com/romkatv/powerlevel10k?tab=readme-ov-file#extra-or-missing-spaces-in-prompt-compared-to-powerlevel9k)
ZLE_RPROMPT_INDENT=0
