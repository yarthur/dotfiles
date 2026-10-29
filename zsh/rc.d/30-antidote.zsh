antidote_dir="$XDG_DATA_HOME/antidote"
plugins_txt="$ZDOTDIR/plugins.txt"
plugins_zsh="$XDG_CACHE_HOME/antidote/plugins.zsh"

# Compile bundles if configured
zstyle ':antidote:bundle:*' zcompile 'yes'

# Only runtime sourcing
if [[ -f "$plugins_zsh" ]]; then
  zlog_debug "sourcing plugin bundle"
  source "$plugins_zsh"
else
  zlog_warn "missing plugins.zsh (run installer)"
fi
