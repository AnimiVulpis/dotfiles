# Configuration for aws cli

I prefer the following config values

```ini
[default]
cli_auto_prompt = on-partial
cli_pager = bat -p
output = table
```

- `cli_auto_prompt = on-partial`: If something is missing from the `aws` cli invocation the auto-prompt will "launch"
- `cli_pager = bat -p`: This leads to pagination **only** if the result would span more than one terminal height
- `output = table`: As this seems to be the most readable for humans, another "good" value is `text`
