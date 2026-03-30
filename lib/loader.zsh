########################################
# Error helper
########################################
dotfiles_print_error_and_exit() {
  print -u2 -- "[dotfiles] ERROR: $*"
  exit 1
}

########################################
# Registry: command name -> file path
########################################
typeset -gA DOTFILES_COMMAND_FILE_BY_NAME=()

########################################
# Register a single command file
# Arguments:
#   $1 = command name (e.g. "install")
#   $2 = full path to command file
########################################
dotfiles_register_single_command() {
  emulate zsh
  set -u

  local command_name="$1"
  local command_file_path="$2"

  if [[ ! -f "$command_file_path" ]]; then
    dotfiles_print_error_and_exit "Command file not found: $command_file_path"
  fi

  # Validate that the command defines main(), without leaking helpers
  if ! (
    emulate -L zsh
    set -u
    source "$command_file_path"
    (( ${+functions[main]} ))
  ); then
    dotfiles_print_error_and_exit \
      "Command '$command_name' must define a main() function in: $command_file_path"
  fi

  DOTFILES_COMMAND_FILE_BY_NAME[$command_name]="$command_file_path"
}

########################################
# Register all commands from a directory
# Arguments:
#   $1 = commands directory path
########################################
dotfiles_register_all_commands() {
  emulate zsh
  set -u
  setopt nullglob

  local commands_directory_path="$1"
  local command_file_path
  local command_basename
  local command_name

  if [[ -z "$commands_directory_path" ]]; then
    dotfiles_print_error_and_exit "Commands directory path is required"
  fi

  for command_file_path in "$commands_directory_path"/*.zsh; do
    command_basename="${command_file_path:t}"
    command_name="${command_basename:r}"
    dotfiles_register_single_command "$command_name" "$command_file_path"
  done
}

########################################
# List commands (for help output)
########################################
dotfiles_list_registered_commands() {
  emulate zsh
  set -u

  local command_name
  for command_name in ${(k)DOTFILES_COMMAND_FILE_BY_NAME}; do
    print -r -- "$command_name"
  done | sort
}

########################################
# Run a command by name
# Arguments:
#   $1 = command name
#   remaining args are passed to command's main()
########################################
dotfiles_run_command() {
  emulate zsh
  set -u

  local command_name="$1"
  shift || true

  local command_file_path="${DOTFILES_COMMAND_FILE_BY_NAME[$command_name]-}"

  if [[ -z "$command_file_path" ]]; then
    dotfiles_print_error_and_exit "Unknown command: $command_name"
  fi

  # Execute the command in a subshell to prevent helper leakage
  (
    emulate -L zsh
    set -euo pipefail
    source "$command_file_path"
    main "$@"
  )
}

########################################
# Dispatch entrypoint
########################################
dotfiles_dispatch() {
  emulate zsh
  set -u

  local requested_command

  if (( $# > 0 )); then
    requested_command="$1"
    shift
  else
    requested_command="help"
  fi

  if [[ "$requested_command" == "help" || "$requested_command" == "-h" || "$requested_command" == "--help" ]]; then
	export DOTFILES_HELP=1
	
	if (( $# > 0 )); then
		requested_command="$1"
		shift || true

		dotfiles_dispatch "$requested_command" "$@"
	else
		print "Usage: dotfiles <command> [args...]"
		print ""
		print "Available commands:"
		dotfiles_list_registered_commands | sed 's/^/  /'
		print ""
	fi

	return 0
  fi

  dotfiles_run_command "$requested_command" "$@"
}

########################################
# Return registered commands (for completion)
########################################
dotfiles_complete_commands() {
  emulate zsh
  set -u

  local command_name
  for command_name in ${(k)DOTFILES_COMMAND_FILE_BY_NAME}; do
    print -r -- "$command_name"
  done | sort
}
