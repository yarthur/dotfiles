# dotfiles:desc Update tools and their plugins.
source "$DOTFILES_HOME/lib/args.zsh"
source "$DOTFILES_HOME/lib/command-helpers.zsh"

_help() {
	cat << 'EOF'
Update tools and plugins.

Usage:
	dotfiles update [options]

Options:
	-- dry-run, -n   Print what would happen (your script checks DRY_RUN env).
	-- help, h       Show this help.
EOF

	return 0
}

main() {
	emulate -L zsh
	set -euo pipefail
	setopt extendedglob nullglob

	#Normalize arguments first
	local -a args
	args=("${(@f)$(args_expand_short_flags "$@")}")

	local dry_run
	local -a positional=()

	#Parse options
	for arg in "${args[@]}"; do
		case "$arg" in
			-h|--help)
				export DOTFILES_HELP=1
				;;
			-n|--dry-run)
				dry_run=1
				shift
				;;
			--)
				# end of options -- remainder should be passed to potention
				# nested functions.
				shift
				positional +=("$@")
				break
				;;
			-*)
				print -u2 "dotfiles update: unknown option: $1 (try --help)."
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
	print "Updating tools and plugins."
	print "================================================================================"

	if [[ -n "${dry_run:-}" ]]; then
		enable_dry_run
	fi

	if read -q "brew?Update Homebrew apps? (Y/n) "; then
		print ""
		run_command "${DOTFILES_HOME}/lib/brew.zsh"
	fi

	local update_script_filename="update.zsh"

	local src

	local self="${(%):-%x}"
	local root="${DOTFILES_HOME:A}"
	
	for src in \
		"$root"/**/"$update_script_filename"~("$root"/backup/**|"$self")(.)
	do
		$src
	done

	return 0
}
