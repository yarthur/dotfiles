# dotfiles:desc Install configuration(s).
source "$DOTFILES_HOME/lib/args.zsh"
source "$DOTFILES_HOME/lib/command-helpers.zsh"

_help() {
	cat <<'EOF'
Install configuration(s).

Usage:
	dotfiles install [options] [configuration]

If `configuration` is not passed, it functions the same as `--all`

Options:
  --all, -a       Install all configurations.
  --dry-run, -n   Print what would happen (your script checks DRY_RUN env).
  --help, -h      Show this help.
EOF

return 0
}

main() {
	emulate -L zsh
	set -euo pipefail
	setopt extendedglob nullglob

	# Normalize arguments first
	local -a args
	args=("${(@f)$(args_expand_short_flags "$@")}")

	local dry_run
	local -a positional=()

	# Parse options
	for arg in "${args[@]}"; do
		case "$arg" in
			-a|--all)
				export INSTALL_ALL=1
				;;
			-h|--help)
				export DOTFILES_HELP=1
				;;
			-n|--dry-run)
				dry_run=1
				shift
				;;
			--)
				shift
				positional+=("$@")
				break
				;;   # end of options
			-*)
				print -u2 "install: unknown option: $1 (try --help)"
				return 2
				;;
			*) 
				positional+=("$arg")
				;;
		esac
	done

	if [[ -n "${DOTFILES_HELP:-}" ]]; then
		_help
		return 0
	fi

	print
	print "Installing configurations."
	print "================================================================================"

	if [[ -n "${dry_run:-}" ]]; then
		enable_dry_run
	fi

	local install_script_filename="install.zsh"

	local src

	local self="${(%):-%x}"
	local root="${DOTFILES_HOME:A}"
	if [[ -n "${INSTALL_ALL:-}" || ! -n "${1:-}" ]]; then
		for src in \
			"$root"/**/"$install_script_filename"~("$root"/backup/**|"$self")(.)
		do
			$src
		done
return 0
	fi

	src="$DOTFILES_HOME/$1/$install_script_filename"
	shift || true

	_run "$src" "$@"
}

_run() {
	if [[ -n "${DRY_RUN:-}" ]]; then
		print_dry_run "$@"
	else
		zsh "$@"
	fi
}
