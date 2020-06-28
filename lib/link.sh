#!/usr/bin/env bash

if [ "$separator" = "" ]; then
	source "$(dirname "$0")"/env.sh
fi

backup_dir=$DOTFILES_HOME/backup
file_ext='.symlink'

echo "Creating symlinks"
echo $separator

linkables=$( find -H "$DOTFILES_HOME" -name "*$file_ext" )
for file in $linkables ; do
	target="$HOME/.$( basename $file "$file_ext" )"

	if [ -h $target ]; then
		echo "~${target#Home} already exits... Skipping."
	else
		if [ $target ]; then
			echo "Backing up ~${target#Home} to $backup_dir"

			if [ ! -d $backup_dir ]; then
				mkdir $backup_dir
			fi

			mv $target $backup_dir
		fi

		echo "Creating link for $file"
		ln -s $file $target
	fi
done
