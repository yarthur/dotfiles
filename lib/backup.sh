#!/usr/bin/env bash

if [ "$separator" = "" ]; then
	source "$(dirname "$0")"/env.sh
fi

echo "Creating backup"
echo $separator

backup_dir=$DOTFILES_HOME/backup
file_ext='.symlink'

if [ ! -d $backup_dir ]; then
	echo "Creating backup directory at $backup_dir."

	mkdir $backup_dir
fi

linkables=$( find -H "$DOTFILES_HOME" -name "*$file_ext" )

for file in $linkables; do
	filename=".$( basename $file "$file_ext" )"
	target="$HOME/$filename"

	if [ $target ] && [ ! -h $target ]; then
		echo "backing up $filename"
		mv $target $backup_dir
	fi
done

if [ $1 ] && [ $1 ] && [ ! -h $1 ]; then
	echo "backing up $1"
	mv $1 $backup_dir
fi
