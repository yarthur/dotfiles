dotfiles_cache=$XDG_CACHE_HOME/dotfiles
mkdir -p "$dotfiles_cache"

# Look for a file telling us it's been over a week since we last updated.
# If found, delete it so we know to run antidote update.
find $dotfiles_cache -name '.up2date' -maxdepth 1 -type f -mtime +7 -delete

if [[ ! -r $dotfiles_cache/.up2date ]]; then
  $DOTFILES_HOME/dotfiles.sh update
  touch $dotfiles_cache/.up2date
fi


