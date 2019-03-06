#!/bin/sh
set -e

cd ~/.vim_runtime

cp -R .vimrc ~/.vimrc

# Removing vim plug
rm -rf ~/.vim/autoload/plug.vim

# Cloning vim plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo "Installed the Ultimate Vim configuration successfully! Enjoy :-)"
