#!/usr/bin/env zsh

set -euo pipefail

source "$DOTFILES_HOME/lib/command-helpers.zsh"

link() {
	backup_dir="$DOTFILES_HOME/backup"
	file_ext=".symlink"

	# Optional directory argument
	search_dir="${1:-$DOTFILES_HOME}"

	echo "Creating symlinks in: $search_dir"

	# Use an array to safely handle filenames
	linkables=(${(f)"$(find -H "$search_dir" -name "*$file_ext")"})

	for file in $linkables; do
		target="$HOME/.${${file:t}%$file_ext}"

		if [[ -L "$target" && "$(readlink "$target")" == "$file" ]]; then
			echo "~${target#$HOME} already correctly linked... Skipping."
			continue
		fi

		if [[ -e "$target" ]]; then
			echo "Backing up ~${target#$HOME} to $backup_dir"

			run_command mkdir -p "$backup_dir"
			run_command mv "$target" "$backup_dir/"
		fi

		echo "Creating link for $file"
		run_command ln -s "$file" "$target"
	done
}
