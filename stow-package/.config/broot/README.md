Creation of the `launcher` folder was done by running
```
broot --print-shell-function zsh > ~/dotfiles/stow-package/.config/broot/launcher/zsh/br
```
To tell `broot` that the `br` function was installed do
```
broot --set-install-state installed # (other possible values are undefined and refused)
```
