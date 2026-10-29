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

alias treadme='touch README.md'

# Run Docker Locally
alias rdl8='docker run -v `pwd`:/var/www -it --rm repo.mutualofomaha.com:5003/com.mutualofomaha.mac/base:8.0'
alias rdl='docker run -v `pwd`:/var/www -it --rm repo.mutualofomaha.com:5003/com.mutualofomaha.mac/base:8.2'
#
# Docker Kill (well... Stop) All
alias dka='docker stop $(docker ps -q)'
