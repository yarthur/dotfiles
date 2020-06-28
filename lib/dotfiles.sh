[ -n "$XDG_CONFIG_HOME" ] || export XDG_CONFIG_HOME=$HOME/.config
[ -n "$DOTFILES_HOME" ] || export DOTFILES_HOME=$XDG_CONFIG_HOME/dotfiles
[ -n "$DOTFILES_LIB" ] || export DOTFILES_LIB=$DOTFILES_HOME/lib

here=${0:A:h}
separator="================================================================================"

if [ "$1" = "" ] || [ $1 = "bootstrap" ]; then
	# Checks to see if the repository has been cloned and set up. Output is suppressed.
	check_for_repo=$($(which git) --git-dir=$DOTFILES_HOME/.git --work-tree=$DOTFILES_HOME status 2>&1)

	if [ ! $? -eq 0 ]; then
		dotfile_repo_url=https://github.com/yarthur/dotfiles

		if test ! $(which git); then
			if test $(which apt-get); then
				sudo apt-get install build-essential curl file git
			elif test $(which yum); then
				sudo yum groupinstall 'Development Tools'
				sudo yum install curl file git
				sudo yum install libxcrypt-compat # needed by Fedora 30 and up
			elif ! "$OSTYPE" = "Darwin"; then
				echo "Unable to install Homebrew. ¯\_(ツ)_/¯"
				exit
			fi
		fi

		echo "Cloning $dotfile_repo_url to $DOTFILES_HOME."
		echo $separator

		git clone $dotfile_repo_url $DOTFILES_HOME

		# If this script isn't located in the "correct" location, clean it up.
		if [ ! "$here" = "$DOTFILES_LIB" ]; then
			echo "Attempting to clean up $0"
			rm -- "$0"
		fi
	fi

	sh -c "$DOTFILES_LIB/brew.sh"
	sh -c "$DOTFILES_LIB/link.sh"
	sh -c "$DOTFILES_LIB/install.sh"
fi

shift 1
echo $@
