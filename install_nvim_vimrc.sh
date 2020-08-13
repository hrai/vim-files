#!/bin/sh
set -e

NVIM_FOLDER=~/.config/nvim

mkdir -p $NVIM_FOLDER

cp -R .vimrc $NVIM_FOLDER/init.vim

# Removing vim plug
rm -rf ~/.vim/autoload/plug.vim

# Cloning vim plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

python3 -m pip install --user --upgrade pynvim

echo "Installed the Ultimate Vim configuration successfully for neovim! Enjoy
:-)"
