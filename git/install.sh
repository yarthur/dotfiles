#!/usr/bin/env bash

echo -e "\n\nInstalling Git and Related"
echo "=============================="

if test ! $(which diff-so-fancy); then
	echo -e "Installing diff-so-fancy."
	brew install diff-so-fancy
fi

if test ! $(which git); then
	echo -e "Install Git."
	brew install git
fi

if test ! $(which git-flow); then
	echo -e "Installing git-flow."
	brew install git-flow
fi
