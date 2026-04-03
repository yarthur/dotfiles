#!/usr/bin/env zsh
source "$DOTFILES_HOME/lib/command-helpers.zsh"

print ""
print ""
print "Neovim"
print "################################################################################"
print ""

if [[ ! "$(readlink $XDG_CONFIG_HOME/nvim)" = "$DOTFILES_HOME/nvim" ]]; then
	print "Backing up pre-existing config."
	run_command "$DOTFILES_LIB/backup.sh" "$XDG_CONFIG_HOME/nvim"
fi

if [[ ! -h $XDG_CONFIG_HOME/nvim ]]; then
	print "Linking managed config."
	run_command ln -s "$DOTFILES_HOME/nvim" "$XDG_CONFIG_HOME/nvim"
fi

print "Installing/Upgrading Plugins"

run_command pip3 install -U neovim

run_command npm uninstall -g neovim && npm install -g neovim

run_command nvim --headless +Lazy! sync +MasonUpdate +TSUpdateSync +qa
