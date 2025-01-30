#!/usr/bin/env zsh
set -e              # Exit if a command exits with a non-zero status
set -u              # Treat unset variables as an error
set -o pipefail     # Treat any non-zero status in a pipeline like a total pipeline failure
set -o localoptions # Ensure options are local to the function or script

# Check if first argument is a valid directory
if [ ! -d "$1" ]; then
    echo "$1 is not valid directory"
    exit 0
fi

update_subfolder_repos() {
    local git_fetch_error git_status git_diff
    local subfolder_list=($(eza -D "$1"))
    local max_length=40 # Plus one char on each side makes 42^^
    for subfolder in ${subfolder_list[@]}; do
        if (( ${#subfolder} > max_length )); then
            max_length=${#subfolder}
        fi
    done
    for subfolder in ${subfolder_list[@]}; do
        # Use the Box Drawing Light Left (U+2574) character for padding
        echo -n "${(r:max_length::╴:: :)subfolder}"
        echo -n " \e[34mFetching\e[0m"
        # If it's not a git repository, git will return an error that needs to be suppressed
        git_fetch_error=$(git -C "$1/${subfolder}" fetch --quiet origin 2>&1) &&
            echo -n "\e[8D\e[32mOK\e[0m" &&
            git_status=$(git -c color.status=always -C "$1/${subfolder}" status --untracked-files=no --short --branch 2>/dev/null) &&
            echo " $git_status" | head -n1 | tr -d '\n' &&
            git_diff=$(git -C "$1/${subfolder}" diff --shortstat | tail -n1) &&
            echo -e "\e[33m$git_diff\e[m" ||
            echo -e "\e[8D\e[31mFAILED\e[0m \e[36m${git_fetch_error}\e[0m"
    done
}

update_subfolder_repos "$1"
