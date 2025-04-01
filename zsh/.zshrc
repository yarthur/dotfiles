# Clone Zephyr.
[[ -d ${XDG_CONFIG_HOME:-~/.config}/zephyr ]] ||
  git clone --depth=1 https://github.com/mattmc3/zephyr ${XDG_CONFIG_HOME:-~/.config}/zephyr

# Use zstyle to specify which plugins you want. Order matters.
zephyr_plugins=(
	color
	completion
	directory
	editor
	history
	macos
	zfunctions
)
zstyle ':zephyr:load' plugins $zephyr_plugins

# Source Zephyr.
source ${XDG_CONFIG_HOME:-~/.config}/zephyr/zephyr.zsh

# Clone Antidote
[[ -d ${XDG_CONFIG_HOME:-~/.config}/antidote ]] ||
  git clone --depth=1 https://github.com/mattmc3/antidote.git ${XDG_CONFIG_HOME:-~/.config}/antidote
# source antidote
source ${XDG_CONFIG_HOME:-~/.config}/antidote/antidote.zsh

# initialize plugins statically with ${ZDOTDIR:-~}/.zsh_plugins.txt
antidote load

