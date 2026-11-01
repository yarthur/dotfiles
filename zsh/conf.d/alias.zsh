# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Use NeoVim instead of ViM
alias vi=nvim
alias vim=nvim

# Use RipGrep instead of Grep
alias grep=rg

# Git log with dates, as opposed to relative time elapsed.
alias glob='git log --graph --pretty='\''%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%ci) %C(bold blue)<%an>%Creset'\'' --abbrev-commit'
alias globa='git log --graph --pretty='\''%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%ci) %C(bold blue)<%an>%Creset'\'' --abbrev-commit --all'

# Other handy Git shortcuts
alias gpo='git push origin'
alias gpsup='git push --set-upstream origin HEAD'

alias treadme='touch README.md'

# Docker Kill (well... Stop) All
alias dka='docker stop $(docker ps -q)'
