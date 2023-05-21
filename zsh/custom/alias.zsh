# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Use NeoVim instead of ViM
alias vi=nvim
alias vim=nvim

# Git log with dates, as opposed to relative time elapsed.
alias glob='git log --graph --pretty='\''%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%ci) %C(bold blue)<%an>%Creset'\'' --abbrev-commit'
alias globa='git log --graph --pretty='\''%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%ci) %C(bold blue)<%an>%Creset'\'' --abbrev-commit --all'

alias treadme='touch README.md'

alias compup='$(which php) -d memory_limit=-1 $(which composer) update -v'

alias fuzscaler='dr run -i -v $(pwd):/var/www:delegated --rm repo.mutualofomaha.com:5003/com.mutualofomaha.mac/base:7.3'
