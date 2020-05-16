#!/bin/sh
set -e

cd ~/.vim_runtime
cp -R .vimrc ~/

# Removing vim plug
rm -rf ~/.vim/autoload/plug.vim

echo 'Cloning vim plug...'
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo 'Setting up neovim config...'
NVIM_CONFIG=~/.config/nvim/
mkdir -p $NVIM_CONFIG
cp -R init.vim $NVIM_CONFIG/

# for windows
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo "Installed the Ultimate Vim configuration successfully! Enjoy :-)"

