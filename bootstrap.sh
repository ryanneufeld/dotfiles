#!/bin/bash

os=$(uname)
apt=false
brew=false

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
type -p brew &> /dev/null && zsh=true
[ $zsh ] && echo "Found Zsh!" || echo "Could not find Zsh!";