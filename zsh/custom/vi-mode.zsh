# VIM mode in zsh
bindkey -v

# Bind "jj" to "ESC in Insert Mode
bindkey -M viins ‘jj’ vi-cmd-mode

################################################################################
# The following settings were cribbed from
#   http://stratus3d.com/blog/2017/10/26/better-vi-mode-in-zshell/
################################################################################
# Bind "Ctrl+r" to search history
bindkey ‘^R’ history-incremental-search-backward

# Better searching in command mode
bindkey -M vicmd '?' history-incremental-search-backward
bindkey -M vicmd '/' history-incremental-search-forward

# Beginning search with arrow keys
bindkey "^[OA" up-line-or-beginning-search
bindkey "^[OB" down-line-or-beginning-search
bindkey -M vicmd "k" up-line-or-beginning-search
bindkey -M vicmd "j" down-line-or-beginning-search

# Easier, more vim-like editor opening
bindkey -M vicmd "^V" edit-command-line

# PROMPT
# Updates editor information when the keymap changes.
function zle-keymap-select() {
  zle reset-prompt
  zle -R
}

zle -N zle-keymap-select

function vi_mode_prompt_info() {
  echo "${${KEYMAP/vicmd/[% NORMAL]%}/(main|viins)/[% INSERT]%}"
}

# define right prompt, regardless of whether the theme defined it
RPS1='$(vi_mode_prompt_info)'
RPS2=$RPS1

################################################################################
# End cribbed settings
################################################################################
