################################################################################
# Enable Dry-Run
# 	Sets DRY_RUN=1 and fires off the message to indicate the following
# 	commands are (or, at least, should be) in DRY RUN mode.
################################################################################
enable_dry_run() {
	# If DRY_RUN has not been set to true, we set it here, and fire the
	# message. Otherwise, there's nothing more we need to do.
	if [[ ! -n "${DRY_RUN:-}" ]]; then
		export DRY_RUN=1
		print -u2 "⚠️  DRY‑RUN MODE ENABLED"
	fi
}


################################################################################
# Print Dry-Run
# 	Sets DRY_RUN=1 and fires off the message to indicate the following
# 	commands are (or, at least, should be) in DRY RUN mode.
################################################################################
print_dry_run() {
	print -u2 "[DRY RUN]: $@"
}


################################################################################
# Run Command
# 	If Dry Run, prints the command to be executed.
# 	Otherwise, runs the command.
################################################################################
run_command() {
	if [[ -n "${DRY_RUN:-}" ]]; then
		print_dry_run "$@"
		print ""
	else
		"$@"
	fi
}


################################################################################
# Get Latest Release tag from GitHub
################################################################################
github_latest_release() {
	local owner="$1"
	local repo="$2"
	local url="https://api.github.com/repos/${owner}/${repo}/releases/latest"

	local version

	# Prefer JQ
	if command -v jq >/dev/null 2>&1; then
		version="$(
			curl -fsSL "$url" |
			jq -r '.tag_name'
		)"
	else
	# Otherwise, sed
		version="$(
			curl -fsSL "$url" |
			sed -n 's/.*"tag_name": "\([^"]*\)".*/\1/p'
		)"
	fi

	[[ -n "$version" ]] || {
		print -u2 "Unable to determine $repo version"
		return 1
	}

	print -u2 "Latest $repo version: $version"

	print -- "$version"
}
