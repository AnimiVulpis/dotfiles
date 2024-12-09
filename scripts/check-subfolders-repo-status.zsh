#!/usr/bin/env zsh
set -e          # Exit if a command exits with a non-zero status
set -u          # Treat unset variables as an error
set -o pipefail # Treat any non-zero status in a pipeline like a total pipeline failure

# The basis for this script is this command I used:
# for folder in ./*/; do echo -n "${(r:30:::::)folder}"; git -C $folder status --untracked-files=no --short --branch; done
for subfolder in ./*/; do
    echo -n "${(r:32:::::)subfolder}"
    # If it's not a git repository, git will return an error that needs to be suppressed
    git_status=$(git -c color.status=always -C $subfolder status --untracked-files=no --short --branch 2>/dev/null) &&
        echo "$git_status" | head -n1 | tr -d '\n' &&
        echo -ne "\e[0G\e[130C" &&
        git_diff=$(git -C $subfolder diff --shortstat | tail -n1) &&
        echo -e "\e[33m$git_diff\e[m" ||
        echo -e '## \e[36mNot a git repository\e[m'
done
