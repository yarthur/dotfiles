#!/usr/bin/env bash
config_files="$HOME/.dotfiles"

echo -e "\n\nGit"
echo -e "=============================="

# If the git config dir exists, but isn't symlinked to this version, back up and remove.
if [ ! "$(readlink $HOME/.config/git)" = "$config_files/git" ]; then
	$config_files/lib/backup.sh ~/.config/git
fi

# Link this directory to ~/.config/git
if [ ! -h $HOME/.config/git ]; then
	ln -s $HOME/.dotfiles/git $HOME/.config/git
fi
