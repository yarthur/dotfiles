#!/usr/bin/env zsh
source "$DOTFILES_HOME/lib/command-helpers.zsh"

print ""
print ""
print "TMux"
print "################################################################################"
print ""

print "Update TPM-Redux and associated plugins."
run_command $DOTFILES_HOME/tmux/plugins/tpm-redux/bin/update
