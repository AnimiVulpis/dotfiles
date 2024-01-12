# How to test if your `includeIf` statements work as expected

```bash
git config --list --show-origin
```

Combine this with `--local`, `--global` or `--system` to test the different config levels.

## (A bit out of context) How to test if your ignore configs work as expected

```bash
git check-ignore -v file-or-folder-you-expect-to-be-in-or-excluded
```

# Content of `config.local` referenced in `config`

The content of `config.local` is used to load local `gitconfig` files for folder(s) that contain repositories.
The configuration will be specific to the folder(s) and will not be applied globally.

Example content of a `config.local`:

```ini
[includeIf "gitdir:~/projects/"]
    path = ~/projects/.gitconfig

[includeIf "gitdir:~/other-projects/"]
    path = ~/other-projects/gitconfig
```

The exact name of the config file is not important, just that it's referenced in the `config.local` file.
This only works because the `config.local` file is referenced in the `config` file. For example:

```ini
[include]
    path = ~/.config/git/config.local
# Or like this (because the path is relative to the config file)
[include]
    path = ./config.local
```

# Content of `gitconfig` files referenced in `config.local`

These files only work because they are included in the git configuration.
That's because there is a matching `includeIf` statement in the `config.local` file.
And `config.local` in turn is `include`d in the `config` file.
Those files contain folder specific configurations. For example:

```ini
[user]
    name = "<username>"
    email = user.email@gmail.com
    signingkey = /Users/user/.ssh/private_secure_signing_key
[gpg]
    format = ssh
[commit]
    gpgsign = true
```

# Further notes

In some cases it might be necessary to have two similar, but still different `includeIf` statements for _technically_ the same folder.
This happened to me on linux where "symlinking" e.g. `~/repos/` to `/<some-folder>/repos` made me need two configs per folder
to work in "both" cases (inside the repos root folder **and** inside a repos sub-folders).
For example:

```ini
[includeIf "gitdir:~/repos/"]
    path = ~/repos/some_git_config_file
[includeIf "gitdir:/<some-folder>/repos/"]
    path = ~/repos/some_git_config_file
```

# Related resources

-   https://git-scm.com/docs/git-config#_includes
-   https://git-scm.com/docs/git-config#_conditional_includes
