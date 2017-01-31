check_installed_taps() {
	tap="$1"

	if brew ls --versions ${tap} > /dev/null; then
		return 0    # found
	else
		return 1    # not found
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

