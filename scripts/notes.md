# Various notes

## Script descriptions

| Script | Description |
|--------|-------------|
| `anti-virus-testfile-content.sh` | Generates EICAR anti-virus test file content |
| `backup-buku.sh` | Copies buku bookmark database to rclone sync folder |
| `backup-zsh-history.sh` | Backs up zsh history file and atuin database to rclone folder |
| `change-some-colors.sh` | Adjusts LS_COLORS in a given file (used with trapd00r/LS_COLORS) |
| `check-node.sh` | Prints commands to check for Node.js LTS updates via nvm |
| `check-subfolders-repo-status.zsh` | Shows git status of all repos in the current directory |
| `do-nothing-template.sh` | Interactive template demonstrating bash `read` options |
| `rclone-backup.sh` | Runs rclone bisync between local folder and Google Drive |
| `repository-updates.zsh` | Fetches updates for all git repos in a given directory |
| `set-terminal-title.zsh` | Sets terminal title with directory/command info (zsh hooks) |
| `update-more.sh` | Updates Rust crates, Go tools, external repos, and Homebrew |
| `wake-up-nas.sh` | Prints commands for Wake-on-LAN and NFS mounting a NAS |

## Removing go packages

```sh
go clean -i -r -n|x <go-package>...
```

* `-i` for binary/archive removal (what `go install` would create)
* `-r` to clean recursively
* `-n` for dry run
* `-x` to print while deleting
* The `...` are sometimes important

## ansi-escape-codes

`\e[<code>m` where `<code>` (more information: https://notes.burke.libbey.me/ansi-escape-codes/)

* `\ 0 = reset formatting`
* `30 = black`
* `31 = red`
* `32 = green`
* `33 = yellow`
* `34 = blue`
* `35 = magenta`
* `36 = cyan`
* `37 = white`

## luarocks

`luarocks --list` to list installed packages

* Installed `luaformatter` via `luarocks install --server=https://luarocks.org/dev luaformatter`
* Be aware of the local config `.luarocks/config-5.4.lua` which only sets `local_by_default = true`
* That's why `luarocks install` does not need the `--local` flag
