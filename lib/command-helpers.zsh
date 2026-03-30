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
		print "⚠️  DRY‑RUN MODE ENABLED"
	fi
}


################################################################################
# Print Dry-Run
# 	Sets DRY_RUN=1 and fires off the message to indicate the following
# 	commands are (or, at least, should be) in DRY RUN mode.
################################################################################
print_dry_run() {
	print "[DRY RUN]: $@"
}


################################################################################
# Run Command
# 	If Dry Run, prints the command to be executed.
# 	Otherwise, runs the command.
################################################################################
run_command() {
	if [[ -n "${DRY_RUN:-}" ]]; then
		print_dry_run "$@"
	else
		zsh "$@"
	fi
}

