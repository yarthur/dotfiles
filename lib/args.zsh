# Argument normalization and parsing helpers for zsh

########################################
# Expand combined short flags
#   -abc  -> -a -b -c
#   --    -> stop processing
########################################
args_expand_short_flags() {
  emulate -L zsh
  set -u

  local -a input=("$@")
  local -a output=()
  local arg char i

  for arg in "${input[@]}"; do
    # End-of-options marker
    if [[ "$arg" == "--" ]]; then
      output+=("$arg")
      continue
    fi

    # Combined short flags: -abc
    if [[ "$arg" == -[!-][!-]* ]]; then
      for (( i = 2; i <= ${#arg}; i++ )); do
        char="${arg[i]}"
        output+=("-$char")
      done
    else
      output+=("$arg")
    fi
  done

  print -rl -- "${output[@]}"
}
