#!/usr/bin/env bash

echo "Installing configurations."

project_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
configs_dir="$HOME/.dotfiles"
install_scripts=$( find -H "." -maxdepth 3 -mindepth 2 -name "install.sh" )

##########################################################
#    Create symlink of project in the home directory.    #
##########################################################
if [ ! -e $configs_dir ]; then
	echo "Creating link for all configs directory at $configs_dir."
	ln -s $project_dir $configs_dir
fi


#####################################
#    Install Brew (if necessary)    #
#####################################
if test ! $(which brew); then
	echo "Installing homebrew"
	ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi


#############################################
#    Install Miscellaneous Brew Packages    #
#############################################
# CLI Tools
brew install ack
brew install z


###############################################################
#    Link all projects' config files to the home directory    #
###############################################################
source $project_dir/lib/link.sh


########################################
#    Run individual install scripts    #
########################################
for file in $install_scripts ; do
	source $file;
done

echo "All done!"
