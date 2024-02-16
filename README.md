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
  - Using Helix [`hx`](https://docs.helix-editor.com/)
  - Using [`eza`](https://github.com/eza-community/eza)
  - Using [`vscode`](https://code.visualstudio.com/)
  - Using [`git`](https://git-scm.com/)
  - Using [`fasd`](https://github.com/clvv/fasd)
    - This got replaced by [`zoxide`](https://github.com/ajeetdsouza/zoxide)
  - Using [`nvm`](https://github.com/nvm-sh/nvm)
  - Using [`broot`](https://github.com/Canop/broot)
    - Stopped using this
  - Optional:
    - [gnu `stow`](https://www.gnu.org/software/stow/)

_I recommend using [gnu stow](https://www.gnu.org/software/stow/) to manage the linking from the `dotfiles/` folder to the `~/` folder._  
_Most of these **dependencies** can be removed._

### Install

To clone this repository into your home folder:

    git clone git@github.com:AnimiVulpis/dotfiles.git

To link the files in the `stow-package` folder using the `stow` command:

```bash
cd dotfiles

# To check changes before use `--no`/`-n` (`--simulate` works too)
# Long format; only changes
stow --stow stow-package --target <HOME_FOLDER/PATH> --verbose=1 --no
# Long format; including skipped files
stow --stow stow-package --target <HOME_FOLDER/PATH> --verbose=2 --no
# Short format; only changes
stow -S stow-package -t <HOME_FOLDER/PATH> -v -n
# Short format; including skipped files
stow -S stow-package -t <HOME_FOLDER/PATH> -vv -n

# To apply changes just remove `--no`/`-n`
# Long format; only changes
stow --stow stow-package --target <HOME_FOLDER/PATH> --verbose=1
# Long format; including skipped files
stow --stow stow-package --target <HOME_FOLDER/PATH> --verbose=2
# Short format; only changes
stow -S stow-package -t <HOME_FOLDER/PATH> -v
# Short format; including skipped files
stow -S stow-package -t <HOME_FOLDER/PATH> -vv

# To simulate use `--no`/`-n` and `--verbose=N`/`-v[v]`

# To unstow (delete)
# Long format
stow --delete stow-package --target <HOME_FOLDER/PATH>
# Short format
stow -D stow-package -t <HOME_FOLDER/PATH>

# To restow (first unstow, then stow again). Useful for pruning obsolete symlinks
# Long format
stow --restow stow-package --target <HOME_FOLDER/PATH>
# Short format
stow -R stow-package -t <HOME_FOLDER/PATH>

# To adapt (pull a file into the stow package)
stow --adopt stow-package --target <HOME_FOLDER/PATH>
```

I am not using `zinit` anymore. Now `znap`

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
