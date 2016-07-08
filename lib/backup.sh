#!/usr/bin/env bash

echo -e "\nCreating backup"
echo "=============================="

config_dir="$HOME/.dotfiles"
backup_dir=$config_dir/.backup
file_ext='.dot'

if [ ! -d ".backup" ]; then
	echo "Creating backup directory at $backup_dir."

	mkdir $backup_dir
fi

linkables=$( find -H "$config_dir" -maxdepth 3 -name "*$file_ext" )

for file in $linkables; do
	filename=".$( basename $file "$file_ext" )"
	target="$HOME/$filename"

	if [ -e $target ] && [ ! -h $target ]; then
		echo "backing up $filename"
		mv $target $backup_dir
	fi
done
