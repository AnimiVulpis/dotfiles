# Broot launcher installation

Might be outdated

Creation of the `launcher` folder was done by running

```sh
broot --print-shell-function zsh > ~/dotfiles/stow-package/.config/broot/launcher/zsh/br
```

To tell `broot` that the `br` function was installed do

```sh
broot --set-install-state installed # (other possible values are undefined and refused)
```
