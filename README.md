# AnimiVulpis dotfiles

### Table of Contents

1. [Install/Usage](#installusage)
2. [Content](#content)

## Install/Usage

### Preconditions

- Needed:
  - Using [`zsh`](https://www.zsh.org/)
  - Following the [XDG Base Directory Specification](https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html)
  - Using [`nvim`](https://github.com/neovim/neovim)
  - Using [`exa`](https://github.com/ogham/exa)
  - Using [`vscode`](https://code.visualstudio.com/)
  - Using [`git`](https://git-scm.com/)
  - Using [`fasd`](https://github.com/clvv/fasd)
  - Using [`nvm`](https://github.com/nvm-sh/nvm)
  - Using [`broot`](https://github.com/Canop/broot)
  - Optional:
    - [gnu `stow`](https://www.gnu.org/software/stow/)

_I recommend using [gnu stow](https://www.gnu.org/software/stow/) to manage the linking from the `dotfiles/` folder to the `~/` folder._  
_Most of these **dependencies** can be removed easily._

### Install

To clone this repository into your home folder:

    $ git clone git@github.com:AnimiVulpis/dotfiles.git

To link the files in the `stow-package` folder using the `stow` command:

    $ cd dotfiles
    ~/dotfiles
    $ # To save use
    $ stow --dotfiles --stow stow-package
    $ # or the short(er)
    $ stow --dotfiles -S stow-package
    $ # To delete use
    $ stow --dotfiles --delete stow-package
    $ # or the short(er)
    $ stow --dotfiles -D stow-package
    $ # To delete and then save use
    $ stow --dotfiles --restow stow-package
    $ # or the short(er)
    $ stow --dotfiles -R stow-package
    $ # Very similar for timew configuration
    $ stow --dotfiles -S timewarrior

Opening a shell will then launch [`zinit`](https://github.com/zdharma/zinit) which will install everything else for you.

To update run `zinit update`

## Content

### [zsh](http://www.zsh.org/)

- A `.zshrc` file containing my configuration
- A `.p10k.zsh` file containing my theme configuration

### [timewarrior](https://taskwarrior.org/docs/timewarrior/index.html)

- A config file
- A theme file for timewarrior

### [git](https://git-scm.com/)

- A `.gitconfig` file containing my `git` configuration
- A `.gitglobalignore` file containing my global ignore rules
