# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=42000
SAVEHIST=21000
bindkey -e
# End of lines configured by zsh-newuser-install

# AnimiVulpis: zplug related
export ZPLUG_HOME="$XDG_CONFIG_HOME/zplug"
export ZPLUG_CACHE_DIR="$XDG_CACHE_HOME/zplug"
source $ZPLUG_HOME/init.zsh
# AnimiVulpis: zplug self-manage
zplug 'zplug/zplug', hook-build:'zplug --self-manage'
# AnimiVulpis: zsh plugins
# Toggles "sudo" before the current/previous command by pressing [ESC][ESC]
zplug "hcgraf/zsh-sudo"
# Fish-like autosuggestions for zsh
zplug "zsh-users/zsh-autosuggestions"
# AnimiVulpis: load zplug
zplug load

# The following lines were added by compinstall
# zstyle :compinstall filename '/home/animi_vulpis/.zshrc'

# autoload -Uz compinit
# compinit
# End of lines added by compinstall

# AnimiVulpis: Defining go paths
export GOPATH="$HOME/go"
export GOBIN="$GOPATH/bin"

# AnimiVulpis: PATH modification for cargo/go
export PATH="$HOME/.cargo/bin:$GOBIN:$PATH"

# AnimiVulpis: fasd initialization
eval "$(fasd --init auto)"

# AnimiVulpis: nvm initialization
export NVM_DIR="$XDG_CONFIG_HOME/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" --no-use

# AnimiVulpis: broot initialization
source /home/animi_vulpis/.config/broot/launcher/bash/br
