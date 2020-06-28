if [ "$separator" = "" ]; then
	source "$(dirname "$0")"/env.sh
fi

install_script_filename=install.sh

echo "\n\nInstalling configurations."
echo $separator

for src in $(find "$DOTFILES_HOME" -name $install_script_filename -not -path "$DOTFILES_LIB/*" -not -path "$DOTFILES_HOME/backup/*" )
    do
      sh -c "${src}"
    done

echo "All done!"
