# -----------------------------------------------------------------------------
# Debug levels:
#   ZSH_DEBUG=0      => off (default)
#   ZSH_DEBUG=1      => structured logs only
#   ZSH_DEBUG=trace  => structured logs + xtrace to file
# Enable with: ZSH_DEBUG=1 zsh
#          or: ZSH_DEBUG=trace zsh
# -----------------------------------------------------------------------------

: ${ZSH_DEBUG:=0}

ZSH_LOG_DIR="${XDG_CACHE_HOME:-$HOME/.cache}/zsh"
ZSH_LOG_FILE="$ZSH_LOG_DIR/startup.log"
ZSH_TRACE_FILE="$ZSH_LOG_DIR/xtrace.log"
mkdir -p "$ZSH_LOG_DIR"

# Structured logger (single-line, grep-friendly)
zlog() {
	[[ "$ZSH_DEBUG" != 0 && -n "$ZSH_DEBUG" ]] || return 0
	local level="$1"; shift
	local ts
	ts="$(date '+%Y-%m-%dT%H:%M:%S.%3N')"
	printf '%s [%s] %s\n' "$ts" "$level" "$*" >>| "$ZSH_LOG_FILE"
}
zlog_debug(){ zlog DEBUG "$@"; }
zlog_info() { zlog INFO  "$@"; }
zlog_warn() { zlog WARN  "$@"; }
zlog_error(){ zlog ERROR "$@"; }

# Timing wrapper (milliseconds), only active when debug enabled
ztime() {
	[[ "$ZSH_DEBUG" != 0 && -n "$ZSH_DEBUG" ]] || { "$@"; return; }
	local start end
	start=$EPOCHREALTIME
	"$@"
end=$EPOCHREALTIME
zlog_info "$* completed in $(( (end - start) * 1000 ))ms"
}

# If trace mode: enable xtrace to a file (not your terminal)
if [[ "$ZSH_DEBUG" == trace ]]; then
	# Open a dedicated FD for tracing and point xtrace there
	exec {__ZSH_XTRACE_FD}>>|"$ZSH_TRACE_FILE"
	export XTRACEFD=$__ZSH_XTRACE_FD

	setopt xtrace            # turn on tracing
	setopt promptsubst       # allow parameter/command expansion in PS4

  # Prefix each trace line with time + file:line + function
  # %D/%* are zsh prompt escapes (date/time), %N = script name, %i = line, %_ = current function
  PS4=$'%D{%Y-%m-%dT%H:%M:%S.%3.} [%N:%i] %_> '
  zlog_info "trace mode enabled (xtrace -> $ZSH_TRACE_FILE)"
fi

zlog_info ".zshrc start (ZSH_DEBUG=$ZSH_DEBUG)"

# -----------------------------------------------------------------------------
# XDG Config
# -----------------------------------------------------------------------------

export HISTFILE="$XDG_STATE_HOME/zsh/history"
mkdir -p "${HISTFILE:h}"

export ZSH_SESSION_DIR="$XDG_STATE_HOME/zsh/sessions"
mkdir -p "$ZSH_SESSION_DIR"

# -----------------------------------------------------------------------------
# Completions (XDG + cached)
# -----------------------------------------------------------------------------

ZSH_COMPDUMP="$XDG_CACHE_HOME/zsh/zcompdump-${ZSH_VERSION}"
mkdir -p "${ZSH_COMPDUMP:h}"

# Add autocompletions for this project.
fpath+=("$XDG_CACHE_HOME/dotfiles")

autoload -Uz compinit
zlog_info "compinit start"
ztime compinit -C -d "$ZSH_COMPDUMP"
zlog_info "compinit end"

[[ -f "$ZSH_COMPDUMP" && ! -f "$ZSH_COMPDUMP.zwc" ]] && {
	zlog_info "compiling compdump"
	zcompile "$ZSH_COMPDUMP"
}

# -----------------------------------------------------------------------------
# Antidote
# -----------------------------------------------------------------------------
# Compile all bundles
zstyle ':antidote:bundle:*' zcompile 'yes'

antidote_dir="$XDG_CONFIG_HOME/antidote"
plugins_txt="$ZDOTDIR/plugins.txt"
plugins_zsh="$XDG_CACHE_HOME/antidote/plugins.zsh"

mkdir -p "$XDG_CACHE_HOME/antidote/"

if [[ ! -d "$antidote_dir" ]]; then
	zlog_info "Installing Antidote"
	git clone --depth=1 https://github.com/mattmc3/antidote.git "$antidote_dir"
fi

# If the plugins.zsh file is not newer than the .txt file
if [[ ! $plugins_zsh -nt $plugins_txt ]]; then
	zlog_info "Antidote bundle start"

	ztime zsh -c '
		source "'"$antidote_dir"'/antidote.zsh"
		antidote bundle <"'"$plugins_txt"'" >"'"$plugins_zsh"'"
	'

	zlog_info "antidote bundle end"
fi

zlog_debug "sourcing plugin bundle"
source "$plugins_zsh"

zlog_info ".zshrc end"
