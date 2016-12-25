#!/usr/bin/env bash

BACKUPDIR=$HOME/dotfile_backup
PWD=`pwd`

cd "$(dirname "${BASH_SOURCE}")";

git pull origin master;

function doIt() {
	rsync --exclude ".git/" \
		--exclude ".DS_Store" \
		--exclude ".osx" \
		--exclude "bootstrap.sh" \
		--exclude "README.md" \
		--exclude "LICENSE-MIT.txt" \
		-avh --no-perms . ~;
	source ~/.bash_profile;
}

function bash_doIt(){
	ln -sf $PWD/.bash_profile $HOME/.
	ln -sf $PWD/.bash_prompt $HOME/.
	ln -sf $PWD/.bashrc $HOME/.
	ln -sf $PWD/.aliases $HOME/.
	ln -sf $PWD/.gitconfig $HOME/.

	source $HOME/.bash_profile
}
function bash_backup(){
	mkdir -p "${BACKUPDIR}"
	rsync --exclude ".git/" \
		--exclude ".bash*/" \
		-avh --no-perms \
		$HOME/.bash* $BACKUPDIR/.;
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
	doIt;
else
	read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
	echo "";
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		bash_backup;
		bash_doIt;
	fi;
fi;
unset doIt;
