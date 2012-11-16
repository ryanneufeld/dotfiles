#!/bin/bash

echo "Authorize sudo"
sudo -v

os=$(uname)
apt=false
brew=false

function installZsh() {
	local answer
	echo "Zsh Not found"
	echo -n "Install Zsh? [Y/n]? "
	read answer
	if [ "${answer}" != "n" -a $apt ]; then
		sudo apt-get install zsh && sudo usermod $USER -s /bin/zsh
		#[ $brew ] && brew install zsh && sudo usermod $USER -s /bin/zsh
	fi
}

echo "Detecting OS"
echo "This is a ${os} box."
if [ $os = "Linux" ]; then
	echo "Checking for apt"
	type -p apt &> /dev/null && apt=true
	[ $apt ] && echo "Found Apt!" || echo "Could not find Apt!";
fi

if [ $os = "Darwin" ]; then
	echo "Checking for brew"
	type -p brew &> /dev/null && brew=true
	[ $brew ] && echo "Found Brew!" || echo "Could not find Brew!";
fi

echo "Checking for zsh:"
type -p zsh &> /dev/null && zsh=true
[ $zsh ] || installZsh;

zsh bootstrap.zsh