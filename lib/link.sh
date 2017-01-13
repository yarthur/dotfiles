#!/usr/bin/env bash

config_dir="$HOME/.dotfiles"
backup_dir=$config_dir/backup
file_ext='.symlink'

echo -e "\nCreating symlinks"
echo "=============================="

linkables=$( find -H "$config_dir" -maxdepth 3 -name "*$file_ext" )

for file in $linkables ; do
	target="$HOME/.$( basename $file "$file_ext" )"

	if [ -h $target ]; then
		echo "~${target#Home} already exits... Skipping."
	else
		if [ -e $target ]; then
			echo "Backing up ~${target#Home} to $config_dir/.backup"

			if [ ! -d $backup_dir ]; then
				mkdir $backup_dir
			fi

			mv $target $backup_dir
		fi

		echo "Creating link for $file"
		ln -s $file $target
	fi
done
