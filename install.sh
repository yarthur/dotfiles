#!/usr/bin/env bash

echo "Installing configurations."

project_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
target="$HOME/.dotfiles"

if [ ! -e $target ]; then
	echo "Creating link for all configs directory at $target."
	ln -s $project_dir $target

	source $project_dir/lib/link.sh
fi

