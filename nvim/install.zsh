#!/usr/bin/env zsh
source "$DOTFILES_HOME/lib/command-helpers.zsh"
source "$DOTFILES_HOME/zsh/conf.d/nvm.zsh"

install() {

	if command -v nvim >/dev/null 2>&1; then
		print "✅ neovim already installed: $(nvim --version)"
		return 0
	fi

	VERSION="stable"
	INSTALL_DIR="$HOME/.local/opt"
	BIN_DIR="$HOME/.local/bin"

	run_command mkdir -p "$INSTALL_DIR" "$BIN_DIR"

	TMP_DIR=$(mktemp -d)
	run_command cd "$TMP_DIR"

	# Detect arch
	ARCH=$(uname -m)
	if [[ "$ARCH" == "arm64" ]]; then
		FILE="nvim-macos-arm64.tar.gz"
	else
		FILE="nvim-macos-x86_64.tar.gz"
	fi

	run_command curl -LO "https://github.com/neovim/neovim/releases/download/${VERSION}/${FILE}"

	# macOS quarantine fix (important)
	run_command xattr -c "$FILE"

	run_command tar xzf  "$FILE" \
			-C "$INSTALL_DIR" \
			--strip-components=1

	# Symlink into PATH
	run_command ln -sf "$INSTALL_DIR/bin/nvim" "$BIN_DIR/nvim"

	rm -rf "$TMP_DIR"

	echo "✅ nvim installed to $BIN_DIR/nvim"
}

print ""
print ""
print "Neovim"
print "################################################################################"
print ""

if [[ ! -d "$INSTALL_DIR" ]]; then
  echo "Installing Neovim"
  install
fi

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

if ! command -v node >/dev/null 2>&1; then
	print "Initializing Node"
	# Load Node/NVM before attempting to use it.
	run_command __load_nvm
fi

print "Install Node Plugin"
run_command npm uninstall -g neovim && npm install -g neovim

print "Install Neovim/LSP/Treesitter stuff."
run_command nvim --headless \
  "+Lazy! sync" \
  "+MasonUpdate" \
  "+TSUpdate all" \
  "+qa"
