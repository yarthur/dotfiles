#j!/usr/bin/env bash
installBrew(){
	echo "\n\n*Brew"
	echo "=============================="
	if test $(which brew); then
		echo "Updating *Brew."
		brew update

		echo "Upgrading packages."
		brew upgrade

		echo "Removing unneeded packages."
		brew cleanup
	else
		if [[ "$OSTYPE" = "darwin"* ]]; then
			echo "Installing homebrew"
			ruby "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
		elif [[ "$OSTYPE" = "linux-gnu" ]]; then
			echo "Installing Linuxbrew"

			# Installing via apt
			if test $(which apt); then
				sudo apt-get install linuxbrew-wrapper
				sudo apt-get install build-essential curl git python-setuptools ruby
			fi

			#Installing via yum? Sorry charlie, no such luck today.
		fi

		echo "Installing CLI Tools"
		brew install ack z
		brew tap universal-ctags/universal-ctags
		brew install --HEAD universal-ctags
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

	echo "\n\nInstalling configurations."
	echo "=============================="

	#	Create symlink of project in the home directory.
	if [ ! $configs_dir ]; then
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

if [ ! $( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )/.git ]; then
	cloneRepo
else
	installConfigs
fi
