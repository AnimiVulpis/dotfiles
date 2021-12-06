# AnimiVulpis dotfiles

## Table of Contents

1. [Install/Usage](#installusage)
2. [Content](#content)
3. [Information](#information)

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
_Most of these **dependencies** can be removed._

### Install

To clone this repository into your home folder:

    git clone git@github.com:AnimiVulpis/dotfiles.git

To link the files in the `stow-package` folder using the `stow` command:

    $ cd dotfiles
    ~/dotfiles
    $ # To check what would happen use simulate
    $ stow -v --simulate stow-package
    $ # To save use
    $ stow --stow stow-package
    $ # or the short(er)
    $ stow -S stow-package
    $ # To delete use
    $ stow --delete stow-package
    $ # or the short(er)
    $ stow -D stow-package
    $ # To delete and then save use
    $ stow --restow stow-package
    $ # or the short(er)
    $ stow -R stow-package

Opening a shell will then launch [`zinit`](https://github.com/zdharma/zinit) which will install everything else for you.

To update run `zinit update`

## Content

## Information

### VSCode extension list

- `alefragnani.Bookmarks`
- `alexkrechik.cucumberautocomplete`
- `apollographql.vscode-apollo`
- `christian-kohler.npm-intellisense`
- `christian-kohler.path-intellisense`
- `cmstead.js-codeformer`
- `DavidAnson.vscode-markdownlint`
- `dbaeumer.vscode-eslint`
- `DotJoshJohnson.xml`
- `dsznajder.es7-react-js-snippets`
- `eamodio.gitlens`
- `ecmel.vscode-html-css`
- `EditorConfig.EditorConfig`
- `eg2.vscode-npm-script`
- `esbenp.prettier-vscode`
- `formulahendry.auto-close-tag`
- `formulahendry.auto-rename-tag`
- `foxundermoon.shell-format`
- `golang.go`
- `GrapeCity.gc-excelviewer`
- `Gruntfuggly.todo-tree`
- `hashicorp.terraform`
- `IBM.output-colorizer`
- `jasonnutter.search-node-modules`
- `Koihik.vscode-lua-format`
- `kumar-harsh.graphql-for-vscode`
- `laktak.hjson`
- `mikestead.dotenv`
- `mrorz.language-gettext`
- `ms-azuretools.vscode-docker`
- `ms-kubernetes-tools.vscode-kubernetes-tools`
- `ms-python.python`
- `ms-python.vscode-pylance`
- `ms-toolsai.jupyter`
- `ms-toolsai.jupyter-keymap`
- `ms-toolsai.jupyter-renderers`
- `ms-vscode-remote.remote-containers`
- `ms-vscode.hexeditor`
- `ms-vsliveshare.vsliveshare`
- `msrvida.vscode-sanddance`
- `naumovs.color-highlight`
- `Orta.vscode-jest`
- `PKief.material-icon-theme`
- `pnp.polacode`
- `Prisma.prisma`
- `RandomFractalsInc.vscode-data-preview`
- `rangav.vscode-thunder-client`
- `redhat.vscode-yaml`
- `rust-lang.rust`
- `streetsidesoftware.code-spell-checker`
- `streetsidesoftware.code-spell-checker-german`
- `sumneko.lua`
- `tamasfe.even-better-toml`
- `tlahmann.alex-linter`
- `VisualStudioExptTeam.vscodeintellicode`
- `yzhang.markdown-all-in-one`
- `Zignd.html-css-class-completion`
