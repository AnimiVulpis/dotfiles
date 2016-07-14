# modify zsh completion
# 0 -- smart case like completion (plus hypen-insensitive)
# 1 -- *add* (the `+`) full case insensitivity
# 2 -- word completion from right side (and on specific anchors)
# 3 -- word completion from left side
zstyle ':completion:*' matcher-list \
	'm:{[:lower:]-_}={[:upper:]_-}' \
	'+m:{[:upper:]}={[:lower:]}' \
	'r:|[-_./]=* r:|=*' \
	'l:|=* r:|=*'
