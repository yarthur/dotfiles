#!/usr/bin/env zsh
source "$DOTFILES_HOME/lib/command-helpers.zsh"
#
# XDG-perfect NVM locations
export NVM_DIR="${XDG_DATA_HOME:-$HOME/.local/share}/nvm"
export NVM_CACHE_DIR="${XDG_CACHE_HOME:-$HOME/.cache}/nvm"
export PROFILE=/dev/null


print ""
print ""
print "Node Version Manager"
print "################################################################################"
print ""

if [[ ! -h $NVM_DIR ]]; then
	print "Creating $NVM_DIR"
	run_command "mkdir -p $NVM_DIR"
fi

if [[ ! -h $NVM_CACHE_DIR ]]; then
	print "Creating $NVM_CACE_DIR"
	run_command "mkdir -p $NVM_CACHE_DIR"
fi

# Fix this later, when you get your stuff in order
if [[ ! "$readlink $HOME/.nvmrc" == "$DOTFILES_HOME/nvm/nvmrc.symlink" ]]; then
	print "Symlinking RC file to $HOME"
	run_command "ln -s $DOTFILES_HOME/nvm/nvmrc.symlink $HOME/.nvmrc"
fi

print "Install NVM"
run_command "curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/refs/heads/master/install.sh | bash"

print "Installing (and setting) default Node (lts/*)."
run_command "source $NVM_DIR/nvm.sh"
run_command "nvm install --default"
