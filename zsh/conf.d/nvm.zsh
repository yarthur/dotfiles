# XDG-perfect NVM locations
export NVM_DIR="${XDG_DATA_HOME:-$HOME/.local/share}/nvm"
export NVM_CACHE_DIR="${XDG_CACHE_HOME:-$HOME/.cache}/nvm"

__load_nvm() {
  zlog_info "NVM load: start (NVM_DIR=$NVM_DIR)"

  # Prevent duplicate loads
  unset -f __load_nvm node npm npx nvm

  local start end
  start=$EPOCHREALTIME

  # Optional: keep trace mode, but avoid logging every line inside nvm.sh
  # Comment these two lines out if you WANT full nvm.sh tracing.
  local __had_xtrace=0
  [[ "$ZSH_DEBUG" == trace ]] && { __had_xtrace=1; unsetopt xtrace; }

  # shellcheck disable=SC1091
  source "$NVM_DIR/nvm.sh"

  (( __had_xtrace )) && setopt xtrace

  end=$EPOCHREALTIME
  zlog_info "NVM load: done in $(( (end - start) * 1000 ))ms"

  # Optional: record the selected node after load (safe + useful)
  command -v node >/dev/null 2>&1 && zlog_debug "NVM load: node=$(command -v node)"
}

# Lazy wrappers
node() { __load_nvm; node "$@"; }
npm()  { __load_nvm; npm  "$@"; }
npx()  { __load_nvm; npx  "$@"; }
nvm()  { __load_nvm; nvm  "$@"; }
yarn() { __load_nvm; yarn "$@"; }

# To enable auto-switching when changing directories, uncomment below.
# autoload -Uz add-zsh-hook
#
# __nvm_auto_load() {
#   zlog_info "NVM switching when changing directories."
#   __load_nvm
#   add-zsh-hook -d chpwd __nvm_auto_load
# }
#
# add-zsh-hook chpwd __nvm_auto_load
#
