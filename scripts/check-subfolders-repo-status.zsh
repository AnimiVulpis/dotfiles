#!/usr/bin/env zsh
set -e              # Exit if a command exits with a non-zero status
set -u              # Treat unset variables as an error
set -o pipefail     # Treat any non-zero status in a pipeline like a total pipeline failure
set -o localoptions # Ensure options are local to the function or script

# Wrap in a function to avoid polluting the global scope if sourced by accident
check_subfolders_repo_status() {
    local git_status git_diff
    local subfolder_list=($(eza -D ./))
    local max_length=40 # Plus one char on each side makes 42^^
    for subfolder in ${subfolder_list[@]}; do
        if (( ${#subfolder} > max_length )); then
            max_length=${#subfolder}
        fi
    done
    for subfolder in ${subfolder_list[@]}; do
        # Use the Box Drawing Light Left (U+2574) character for padding
        echo -n "${(r:max_length::╴:: :)subfolder}"
        # If it's not a git repository, git will return an error that needs to be suppressed
        git_status=$(git -c color.status=always -C $subfolder status --untracked-files=no --short --branch 2>/dev/null) &&
            echo " $git_status" | head -n1 | tr -d '\n' &&
            git_diff=$(git -C $subfolder diff --shortstat | tail -n1) &&
            echo -e "\e[33m$git_diff\e[m" ||
            echo -e ' ## \e[36mNot a git repository\e[m'
    done
}

check_subfolders_repo_status
