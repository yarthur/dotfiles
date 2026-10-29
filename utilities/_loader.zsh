#!/usr/bin/env zsh
#
run_utility_action() {
    local action="$1"
    local file
    local util
    local fn

    for file in "$DOTFILES_HOME/utilities"/*.zsh; do
        util="${file:t:r}"

		print ""
		print ""
		print "$util"
		print "################################################################################"
		print ""

        [[ "$util" == "install" ]] && continue
        [[ "$util" == "update"  ]] && continue

        source "$file"

        fn="${action}_${util}"

        (( ${+functions[$fn]} )) && "$fn"
    done
}
