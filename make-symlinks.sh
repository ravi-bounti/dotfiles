#!/bin/bash
############################
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

# dotfiles directory
dir=$PWD
echo "$dir"
# list of files/folders to symlink in homedir
files="vimrc tmux.conf zshrc"

##########
for file in $files; do
    echo "Creating symlink to $file in $dir."
    ln -sf $dir/.$file ~/.$file
done
