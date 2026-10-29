#!/usr/bin/env zsh

source "$DOTFILES_HOME/lib/command-helpers.zsh"

# Ensure Rust-specific env is available
source "$DOTFILES_HOME/zsh/env.d/rust.zsh"

install_cargo_binstall() {
    emulate -L zsh
    set -euo pipefail

    command -v cargo >/dev/null 2>&1 || {
        print -u2 "cargo is not installed"
        return 1
    }

    if command -v cargo-binstall >/dev/null 2>&1; then
        print "✅ cargo-binstall already installed"
        return 0
    fi

    cargo install cargo-binstall

    print "✅ Installed: $(cargo-binstall --version)"
}

install_rust() {
    emulate -L zsh
    set -euo pipefail

    mkdir -p "$CARGO_HOME" "$RUSTUP_HOME"

    # Ensure Xcode CLI tools exist
    if ! xcode-select -p >/dev/null 2>&1; then
        print -u2 "Xcode Command Line Tools are required."
        print -u2 "Run: xcode-select --install"
        return 1
    fi

    # Install rustup if necessary
    if ! command -v rustup >/dev/null 2>&1; then
        curl --proto '=https' \
             --tlsv1.2 \
             -fsSL \
             https://sh.rustup.rs |
             sh -s -- \
                -y \
                --no-modify-path \
                --default-toolchain stable
    fi

    # Make current shell aware of cargo
    export PATH="$CARGO_HOME/bin:$PATH"

    # Ensure a stable toolchain exists
    rustup toolchain install stable

    # Ensure stable is the default
    rustup default stable

    print "✅ Rust : $(rustc --version)"
    print "✅ Cargo: $(cargo --version)"

	install_cargo_binstall
}

install_via_rust(){
	local crate=$1

	local expected_bin="$CARGO_HOME/bin/$crate"

	if ! command -v "cargo binstall" >/dev/null 2>&1; then
		install_rust
	fi

	# Check if already installed
	cargo install --list 2>/dev/null |
		grep -q "^${crate} v" && {
			print "✅ $crate already installed!"
				return 0
		}
	
    cargo binstall \
        --no-confirm \
        "$crate"

    print "✅ ${crate} installed"
}
