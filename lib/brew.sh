installed_taps="$( brew list )"

check_installed_taps() {
	tap="$1"

	if test "${installed#*$tap}" != "$tap"; then
		return 0    # not found
	else
		return 1    # found
	fi
}


handle_taps() {
	for tap in $@; do
		if $(check_installed_taps $tap); then
			echo "Upgrading $tap"
			brew upgrade --cleanup $tap 2>/dev/null
		else
			echo "Installing $tap"
			brew install $tap
		fi
	done
}

