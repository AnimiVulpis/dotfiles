# path related changes
# zplug
export ZPLUG_HOME=~/.zplug
# brew
export PATH="/usr/local/sbin:$PATH"
# brew coreutils
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
# brew coreutils man
export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"

### history options
export HISTFILE=~/.zsh_history
# history sizes (see `man zshoptions` under `HIST_EXPIRE_DUPS_FIRST`)
export HISTSIZE=20000
export SAVEHIST=10000

# to ignore adjacent history entries
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_VERIFY
setopt SHARE_HISTORY

### directory options
setopt AUTO_CD
setopt AUTO_PUSHD
setopt PUSHD_IGNORE_DUPS
setopt PUSHD_MINUS

### completion options
setopt ALWAYS_TO_END

### zplug
# load zplug (https://github.com/zplug/zplug)
source $ZPLUG_HOME/init.zsh

# let zplug manage itself
zplug "zplug/zplug"

### plugins section start
# sane options for zsh
zplug "willghatch/zsh-saneopt"
# colored man pages
zplug "zlsun/solarized-man"
# osx plugins
zplug "mwilliammyers/plugin-osx"
# sudo with `ESC-ESC`
zplug "hcgraf/zsh-sudo"
# directory listings with git information
zplug "supercrabtree/k"
# solarized dircolors (don't forget to use `setupsolarized dircolors.ansi-dark` at least once)
zplug "joel-porquet/zsh-dircolors-solarized"
# more completions
zplug "zsh-users/zsh-completions"
# nvm plugin
zplug "lukechilds/zsh-nvm"
# npm completions
zplug "lukechilds/zsh-better-npm-completion", defer:2
# gibo autocompletion
zplug "simonwhitaker/gibo", defer:2
# syntax highlighing for the shell
zplug "zsh-users/zsh-syntax-highlighting", defer:2
# history search feature
zplug "zsh-users/zsh-history-substring-search", defer:3
# multiple keywords history search `Ctrl-r`
zplug "psprint/history-search-multi-word"
# personal theme (load after dircolors-solarized)
zplug "AnimiVulpis/dotfiles", use:"zsh/animivulpis.zsh-theme", as:theme
# personal completion configuration
zplug "AnimiVulpis/dotfiles", use:"zsh/completion.zsh", defer:0
# plugins section end

# source plugins and add commands to the PATH
zplug load #--verbose

# zsh-history-substring-search config (https://github.com/zsh-users/zsh-history-substring-search)
zmodload zsh/terminfo
bindkey "\e[A" history-substring-search-up
bindkey "\e[B" history-substring-search-down

# make `fn+delete` behave as it should
bindkey "^[[3~" delete-char

# source things that should not be in the dotfiles repository
[ -f ~/.zsh-additional ] && source ~/.zsh-additional

### other configurations

# make `alt-left` and `alt-right` navigation more sane
export WORDCHARS=''

# make grep use colors by default
alias grep="grep --color=auto"

# use vim instead of vi
alias vi="vim"

# use neovim instead of vim
alias vim="nvim"

# use colors in `ls` by default
alias ls="ls --color=auto"
alias ll="ls --color=auto -lhA"

# less *now* will open atom when pressing `v`
export LESSEDIT="atom %f?lm\:%lm."
# less *now* with code highlighting via source-highlight
export LESSOPEN="| /usr/local/bin/src-hilite-lesspipe.sh %s"
# interpret colors in less (-R) and case-insensitive search (-i)
# as well as with tabs set to 4 spaces (instead of 8)
export LESS="-Ri -x4"
# set editor for svn
export SVN_EDITOR=vim

# for 'fasd' to work
eval "$(fasd --init auto)"
# for nvm to work properly when installed via homebrew
export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh
