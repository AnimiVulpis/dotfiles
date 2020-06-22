#!/bin/zsh
exa -D ~/aur-and-external |
  xargs -n1 -I@ zsh -c \
    "git -C ~/aur-and-external/@ fetch -v origin 2>&1 |
      rg --passthru -e '^   [\[0-9a-f\.]+'"
