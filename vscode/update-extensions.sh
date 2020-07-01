#!/usr/bin/env bash
if [ "$separator" = "" ]; then
	source "$(dirname "$0")"/../lib/env.sh
fi

echo "Updating the list of extensions to install through the script."
echo $separator

install_script=$DOTFILES_HOME/vscode/install-extensions.sh 

rm $install_script
code --list-extensions | xargs -L 1 echo code --install-extension >> $install_script
chmod 744 $install_script
