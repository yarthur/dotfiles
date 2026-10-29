: ${ZSH_DEBUG:=0}

typeset -g ZSH_LOG_DIR="${XDG_CACHE_HOME:-$HOME/.cache}/zsh"
typeset -g ZSH_LOG_FILE="$ZSH_LOG_DIR/startup.log"
typeset -g ZSH_TRACE_FILE="$ZSH_LOG_DIR/xtrace.log"

mkdir -p "$ZSH_LOG_DIR"

zlog() {
#  [[ "$ZSH_DEBUG" != 0 && -n "$ZSH_DEBUG" ]] || return 0
  local level="$1"; shift
  local ts
  ts="$(date '+%Y-%m-%dT%H:%M:%S.%3N')"
  printf '%s [%s] %s\n' "$ts" "$level" "$*" >>| "$ZSH_LOG_FILE"
}

zlog_debug(){ zlog DEBUG "$@"; }
zlog_info() { zlog INFO  "$@"; }
zlog_warn() { zlog WARN  "$@"; }
zlog_error(){ zlog ERROR "$@"; }

ztime() {
  [[ "$ZSH_DEBUG" != 0 && -n "$ZSH_DEBUG" ]] || { "$@"; return; }
  local start end
  start=$EPOCHREALTIME
  "$@"
  end=$EPOCHREALTIME
  zlog_info "$* completed in $(( (end - start) * 1000 ))ms"
}

# Trace mode
if [[ "$ZSH_DEBUG" == trace ]]; then
  exec {__ZSH_XTRACE_FD}>>|"$ZSH_TRACE_FILE"
  export XTRACEFD=$__ZSH_XTRACE_FD

  setopt xtrace promptsubst
  PS4=$'%D{%Y-%m-%dT%H:%M:%S.%3.} [%N:%i] %_> '

  zlog_info "trace mode enabled (xtrace -> $ZSH_TRACE_FILE)"
fi

