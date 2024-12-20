# AnimiVulpis dotfiles

## Table of Contents

1. [Tools/Usage](#toolsusage)
2. [Content](#content)
3. [Information](#information)

## Tools/Usage

- Using:
  - [`zsh`](https://www.zsh.org/)
  - Following the [XDG Base Directory Specification](https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html)
  - Helix [`hx`](https://docs.helix-editor.com/)
  - [`eza`](https://github.com/eza-community/eza)
  - [`vscode`](https://code.visualstudio.com/)
  - [`git`](https://git-scm.com/)
  - [`zoxide`](https://github.com/ajeetdsouza/zoxide)
  - [`nvm`](https://github.com/nvm-sh/nvm)
  - [`lf`](https://github.com/gokcehan/lf)
  - [gnu `stow`](https://www.gnu.org/software/stow/)

_I recommend using [gnu stow](https://www.gnu.org/software/stow/) to manage the linking from the `dotfiles/` folder to the `~/` folder._  

### Information on using `stow`

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

## Content

### `zshrc`

Based on https://github.com/romkatv/zsh-bench `diy++`

## Information
