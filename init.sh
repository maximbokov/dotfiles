#!/bin/bash
# script to get git submodules and create symlinks of dotfiles

dir=$HOME/dotfiles
backup=$HOME/dotfiles.bak

mkdir -p $backup

for file in #dir/*
do
	filename=$(basename $file)
	echo $file
	if [[ "$filename" != "$(basename $0)" ]]
		echo "Creating link for .$filename"
		# move existing dotfiles to $backup
		mv $HOME/.$filename $backup/
		# create symlink
		ln -s $dir/$filename $HOME/.$filename
	fi
done

# pull in submodules
git submodule init && git submodule update

