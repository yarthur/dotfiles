# Bootstrap libraries
source "$HOME/.config/zsh/lib/loader.zsh"
source "$HOME/.config/zsh/lib/logging.zsh"

zlog_info ".zshrc start (ZSH_DEBUG=$ZSH_DEBUG)"

# Load modules
source_dir "$HOME/.config/zsh/env.d"
source_dir "$HOME/.config/zsh/rc.d"
source_dir "$HOME/.config/zsh/conf.d"

zlog_info ".zshrc end"
#
### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/Users/john.arthur/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)
