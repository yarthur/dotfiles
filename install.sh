#!/usr/bin/env bash
installBrew(){
	echo -e "\n\n*Brew"
	echo -e "=============================="
	if test $(which brew); then
		echo -e "Updating *Brew."
		brew update

		echo -e "Upgrading packages."
		brew upgrade

		echo -e "Removing unneeded packages."
		brew cleanup
	else
		if [[ "$OSTYPE" = "darwin"* ]]; then
			echo "Installing homebrew"
			ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
		elif [[ "$OSTYPE" = "linux-gnu" ]]; then
			echo "Installing Linuxbrew"

			# Installing via apt
			if test $(which apt); then
				sudo apt-get install linuxbrew-wrapper
				sudo apt-get install build-essential curl git python-setuptools ruby
			fi

			#Installing via yum? Sorry charlie, no such luck today.
		fi

		echo -e "Installing CLI Tools"
		brew install ack z
	fi
}


installGit(){
	if test ! $(which brew); then
		installBrew
	fi

	echo "Installing Git"
	brew install git
}

cloneRepo(){
	if test ! $(which git); then
		installGit
	fi

	git clone https://github.com/yarthur/configs

	source configs/install.sh
}

installConfigs(){
	project_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
	configs_dir="$HOME/.dotfiles"
	install_scripts=$( find -H "." -maxdepth 3 -mindepth 2 -name "install.sh" )

	echo -e "\n\nInstalling configurations."
	echo -e "=============================="

	#	Create symlink of project in the home directory.
	if [ ! -e $configs_dir ]; then
		echo "Creating link for all configs directory at $configs_dir."
		ln -s $project_dir $configs_dir
	fi

	#	Link all projects' config files to the home directory
	source $project_dir/lib/link.sh

	installBrew

	#	Run individual install scripts
	for file in $install_scripts ; do
		source $file;
	done

	echo "All done!"
}

if [ ! -e $( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )/.git ]; then
	cloneRepo
else
	installConfigs
fi
