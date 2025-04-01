#!/usr/bin/env bash
if [ "$separator" = "" ]; then
	source "$(dirname "$0")"/../lib/env.sh
fi

echo "Zsh"
echo $separator

zsh_path="$(which zsh)"

if brew ls --versions zsh 2>&1; then
	zsh_path="$(brew --prefix)/bin/zsh"
fi

if ! grep -q $zsh_path /etc/shells; then
	sudo echo $zsh_path >> /etc/shells
fi

if [ ! "$SHELL" = "$zsh_path" ]; then
	chsh -s $zsh_path
fi

# If the zsh config dir exists, but isn't symlinked to this version, back up and remove.
if [ ! "$(readlink $XDG_CONFIG_HOME/zsh)" = "$DOTFILES_HOME/zsh" ]; then
	$DOTFILES_LIB/backup.sh $XDG_CONFIG_HOME/zsh
fi

# Link this directory to ~/.config/zsh
if [ ! -h $XDG_CONFIG_HOME/zsh ]; then
	ln -s $DOTFILES_HOME/zsh $XDG_CONFIG_HOME/zsh
fi

# Set ZDOTDIR to ~/.config/zsh
#   We accomplish this by creating a ~/.zshenv file, which sets the value
#   of the var, and then sources the .zshenv file contained in ZDOTDIR.
/bin/cat <<EOM >$HOME/.zshenv
ZDOTDIR=$XDG_CONFIG_HOME/zsh
source -- "\$ZDOTDIR"/.zshenv
EOM

