#!/usr/bin/env bash

# echo "Installing configurations."

# project_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
# target="$HOME/.dotfiles"

# if [ ! -e $target ]; then
# 	echo "Creating link for all configs directory at $target."
# 	ln -s $project_dir $target
# fi

# source $project_dir/lib/link.sh

# source $project_dir/lib/brew.sh


install_scripts=$( find -H "." -maxdepth 3 -mindepth 2 -name "install.sh" )

for file in $install_scripts ; do
	source $file;
done
