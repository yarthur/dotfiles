#!/bin/sh
# This was blatantly cribbed from [Nick Nisi](https://github.com/nicknisis/dotfiles/blob/master/git/templates/hooks/run-hooks.sh)

EXIT_CODE=0

# Only execute if the repo is in the home directory.
if [[ $GIT_DIR != $HOME* ]]; then
	exit $((${EXIT_CODE}))
fi

repo=$( git rev-parse --show-toplevel )
hook_type=$( basename $0 )
hooks=~/.config/dotfiles/git/hooks

echo "Executing $hook_type hook(s)."

for hook in $hooks/*.$hook_type; do
	echo ""
	echo "${COLOR_LIGHTPURPLE}Executing ${hook}${COLOR_NONE}"
	${hook}
	EXIT_CODE=$((${EXIT_CODE} + $?))
done

if [[ ${EXIT_CODE} -ne 0 ]]; then
	echo ""
	echo "${COLOR_RED}Commit Failed.${COLOR_NONE}"
fi

exit $((${EXIT_CODE}))
