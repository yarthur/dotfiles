#!/usr/bin/env zsh
source "$DOTFILES_HOME/lib/command-helpers.zsh"

install_lazygit() {
  emulate -L zsh
  set -euo pipefail

  local version="0.62.2"

  local opt_home="${XDG_OPT_HOME:-$HOME/.local/opt}"
  local install_dir="$opt_home/lazygit"
  local bin_dir="$HOME/.local/bin"

  mkdir -p "$install_dir" "$bin_dir"

  local archive
  case "$(uname -m)" in
    arm64)
      archive="lazygit_${version}_darwin_arm64.tar.gz"
      ;;
    x86_64)
      archive="lazygit_${version}_darwin_x86_64.tar.gz"
      ;;
    *)
      print -u2 "Unsupported architecture: $(uname -m)"
      return 1
      ;;
  esac

  local tmpdir
  tmpdir="$(mktemp -d)"

  (
    cd "$tmpdir"

    curl -fsSLO \
      "https://github.com/jesseduffield/lazygit/releases/download/v${version}/${archive}"

    tar xzf "$archive"

    mkdir -p "$install_dir"

    install \
      -m 755 \
      lazygit \
      "$install_dir/lazygit"
  )

  rm -rf "$tmpdir"

  ln -sf \
    "$install_dir/lazygit" \
    "$bin_dir/lazygit"

  print "✅ Installed: $(lazygit --version)"
}

print ""
print ""
print "Lazygit"
print "################################################################################"
print ""

if [[ ! "$(readlink $XDG_CONFIG_HOME/lazygit)" = "$DOTFILES_HOME/lazygit" ]]; then
	print "Backing up pre-existing config."
	run_command "$DOTFILES_LIB/backup.sh" "$XDG_CONFIG_HOME/lazygit"
fi

if [[ ! -h $XDG_CONFIG_HOME/lazygit ]]; then
	print "Linking managed config."
	run_command ln -s "$DOTFILES_HOME/lazygit" "$XDG_CONFIG_HOME/lazygit"
fi

if ! command -v lazygit >/dev/null 2>&1; then
	install_lazygit
fi
