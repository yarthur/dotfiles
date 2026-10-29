#!/usr/bin/env zsh
source "$DOTFILES_HOME/lib/command-helpers.zsh"
#
source "$DOTFILES_HOME/zsh/env.d/nvm.zsh"

print ""
print ""
print "Node Version Manager"
print "################################################################################"
print ""

if [[ ! -d $NVM_DIR ]]; then
	print "Creating $NVM_DIR"
	run_command mkdir -p "$NVM_DIR"
fi

if [[ ! -d $NVM_CACHE_DIR ]]; then
	print "Creating $NVM_CACE_DIR"
	run_command mkdir -p "$NVM_CACHE_DIR"
fi

if [[ ! -f "$NVM_DIR/nvm.sh" ]]; then
	print "Install NVM"

	PROFILE=/dev/null \
		run_command curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/refs/heads/master/install.sh | bash
fi

print "Installing (and setting) default Node (lts/*)."
run_command source "$NVM_DIR/nvm.sh"
run_command nvm install lts/*
run_command nvm alias default lts/*
