#!/usr/bin/env bash

if [ "$separator" = "" ]; then
	source "$(dirname "$0")"/env.sh
fi

echo "Homebrew"
echo $separator

if test ! $(which brew); then
	echo "Installing Homebrew."
	echo $separator


	bash <(curl -s https://raw.githubusercontent.com/Homebrew/install/master/install.sh)
exit

	# Set brew command in path if it's not already set.
	if test ! $(which brew); then
		test -d ~/.linuxbrew && eval $(~/.linuxbrew/bin/brew shellenv)
		test -d /home/linuxbrew/.linuxbrew && eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
		test -r ~/.bash_profile && echo "eval \$($(brew --prefix)/bin/brew shellenv)" >>~/.bash_profile
		echo "eval \$($(brew --prefix)/bin/brew shellenv)" >>~/.profile
	fi
fi

echo "Updating Homebrew."
echo $separator
brew update

echo "Upgrading packages."
echo $separator
brew upgrade

echo "Removing unneeded packages."
echo $separator
brew cleanup

echo "Installing CLI Tools."
echo $separator
brew bundle --file=$DOTFILES_HOME/Brewfile
