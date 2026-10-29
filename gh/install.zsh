#!/usr/bin/env zsh
source "$DOTFILES_HOME/lib/command-helpers.zsh"

install_gh_cli() {
	OS="$(uname -s)"
	ARCH="$(uname -m)"

	case "$OS" in
		Darwin) PLATFORM="macOS" ;;
		Linux)  PLATFORM="Linux" ;;
		*)
			echo "❌ Unsupported operating system: $OS"
			exit 1
			;;
	esac

	case "$ARCH" in
		x86_64|amd64) ARCH="amd64" ;;
		arm64|aarch64) ARCH="arm64" ;;
		*)
			echo "❌ Unsupported architecture: $ARCH"
			exit 1
			;;
	esac

	TMP_DIR="$(mktemp -d)"
	trap 'rm -rf "$TMP_DIR"' EXIT

	echo "🔍 Looking up latest GitHub CLI release..."

	VERSION="$(
		curl -fsSL https://api.github.com/repos/cli/cli/releases/latest |
			sed -n 's/.*"tag_name": *"v\([^"]*\)".*/\1/p' |
			head -n1
		)"

		if [[ -z "$VERSION" ]]; then
			echo "❌ Failed to determine latest GitHub CLI version"
			exit 1
		fi

		echo "📦 Latest version: $VERSION"

		if [[ "$PLATFORM" == "macOS" ]]; then
			ARCHIVE="gh_${VERSION}_macOS_${ARCH}.zip"
			URL="https://github.com/cli/cli/releases/download/v${VERSION}/${ARCHIVE}"

			curl -fsSL "$URL" -o "$TMP_DIR/$ARCHIVE"
			unzip -q "$TMP_DIR/$ARCHIVE" -d "$TMP_DIR"

			INSTALL_DIR="$HOME/.local/bin"
			mkdir -p "$INSTALL_DIR"

			cp "$TMP_DIR"/gh_*_macOS_*/bin/gh "$INSTALL_DIR/gh"
			chmod +x "$INSTALL_DIR/gh"

		elif [[ "$PLATFORM" == "Linux" ]]; then
			ARCHIVE="gh_${VERSION}_linux_${ARCH}.tar.gz"
			URL="https://github.com/cli/cli/releases/download/v${VERSION}/${ARCHIVE}"

			curl -fsSL "$URL" -o "$TMP_DIR/$ARCHIVE"
			tar -xzf "$TMP_DIR/$ARCHIVE" -C "$TMP_DIR"

			INSTALL_DIR="$HOME/.local/bin"
			mkdir -p "$INSTALL_DIR"

			cp "$TMP_DIR"/gh_*_linux_*/bin/gh "$INSTALL_DIR/gh"
			chmod +x "$INSTALL_DIR/gh"
		fi

		if [[ ":$PATH:" != *":$HOME/.local/bin:"* ]]; then
			echo ""
			echo "⚠️  Add the following to your shell configuration:"
			echo 'export PATH="$HOME/.local/bin:$PATH"'
		fi

		echo ""
		echo "✅ GitHub CLI installed successfully"
		echo "Version: $("$HOME/.local/bin/gh" --version | head -n 1)"
}


print ""
print ""
print "GitHub CLI"
print "################################################################################"
print ""

if ! command -v gh >/dev/null 2>&1; then
  echo "Installing GitHub CLI"

  run_command install_gh_cli
fi

if [ ! "$(readlink $XDG_CONFIG_HOME/gh)" = "$DOTFILES_HOME/gh" ]; then
	print "Backing up pre-existing config."
	run_command "$DOTFILES_LIB/backup.sh" "$XDG_CONFIG_HOME/gh"
fi

# Link this directory to ~/.config/git
if [ ! -h $XDG_CONFIG_HOME/gh ]; then
	print "Linking managed config."
	run_command ln -s "$DOTFILES_HOME/gh" "$XDG_CONFIG_HOME/gh"
fi

print "Install extensions."
run_command gh extension install dlvhdr/gh-dash


