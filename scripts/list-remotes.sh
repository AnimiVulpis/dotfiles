#!/usr/bin/env bash
set -e                   # Exit if a command exits with a non-zero status
set -u                   # Treat unset variables as an error
set -o pipefail          # Treat any non-zero status in a pipeline like a total pipeline failure
shopt -s inherit_errexit # Command substitutions inherit set -e from the parent script

# Define search root (default to current directory if not provided)
SEARCH_DIR="${1:-.}"

echo "Scanning '$SEARCH_DIR' for Git repositories..."

# Find all .git directories and process them
fd --hidden --type directory '^.git$' ./ | sort |while read -r git_dir; do
    repo_dir=$(dirname "$git_dir")
    echo " --- $repo_dir --- "
    git -C "$repo_dir" remote -v
done
