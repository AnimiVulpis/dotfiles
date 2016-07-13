# path related changes
# zplug
export ZPLUG_HOME=~/.zplug
# brew
export PATH="/usr/local/sbin:$PATH"
# brew coreutils
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
# brew coreutils man
export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"

# load zplug (https://github.com/zplug/zplug)
source $ZPLUG_HOME/init.zsh

# let zplug manage itself
zplug "zplug/zplug"

# plugins section start
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
# solarized dircolors
zplug "joel-porquet/zsh-dircolors-solarized", nice:5
# more completions
zplug "zsh-users/zsh-completions"
# nvm plugin
zplug "lukechilds/zsh-nvm"
# npm completions
zplug "lukechilds/zsh-better-npm-completion", nice:10
# gibo autocompletion
zplug "simonwhitaker/gibo", nice:10
# syntax highlighing for the shell
zplug "zsh-users/zsh-syntax-highlighting", nice:11
# history search feature
zplug "zsh-users/zsh-history-substring-search", nice:12
# multiple keywords history search `Ctrl-r`
zplug "psprint/history-search-multi-word", nice:13
# personal theme (load after dircolors-solarized)
zplug "AnimiVulpis/dotfiles", use:"theme/*.zsh-theme", nice:6
# plugins section end

# source plugins and add commands to the PATH
zplug load #--verbose

# zsh-history-substring-search config (https://github.com/zsh-users/zsh-history-substring-search)
zmodload zsh/terminfo
bindkey "$terminfo[cuu1]" history-substring-search-up
bindkey "$terminfo[cud1]" history-substring-search-down
# to ignore adjacent history entries
setopt HIST_FIND_NO_DUPS

# source things that should not be in the dotfiles repository
[ -f ~/.zsh-more ] && source ~/.zsh-more

# use homebrew vim instead of mac os vi
alias vi="/usr/local/bin/vim"

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
