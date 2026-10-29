ZSH_COMPDUMP="$XDG_CACHE_HOME/zsh/zcompdump-${ZSH_VERSION}"
mkdir -p "${ZSH_COMPDUMP:h}"

# Add project completions
fpath+=("$XDG_CACHE_HOME/dotfiles")

autoload -Uz compinit

zlog_info "compinit start"
ztime compinit -C -d "$ZSH_COMPDUMP"
zlog_info "compinit end"

if [[ -f "$ZSH_COMPDUMP" && ! -f "$ZSH_COMPDUMP.zwc" ]]; then
  zlog_info "compiling compdump"
  zcompile "$ZSH_COMPDUMP"
fi
