# Various notes

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
