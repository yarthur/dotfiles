# Add project completions
fpath+=("$XDG_CONFIG_HOME/zsh/completions")

# Interactive completion menu
zstyle ':completion:*' menu select

#Case-insensitive matching
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
