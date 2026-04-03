#!/usr/bin/env zsh
source "$DOTFILES_HOME/lib/command-helpers.zsh"

print ""
print ""
print "NeoVim"
print "################################################################################"
print ""

print "Update Python plugin."
run_command pip3 install --upgrade neovim

print "Update Node plugin."
run_command npm install -g neovim@latest

print "Update Neovim/LSP/Treesitter stuff."
run_command nvim --headless \
  "+Lazy! sync" \
  "+MasonUpdate" \
  "+TSUpdateSync" \
  "+qa"
