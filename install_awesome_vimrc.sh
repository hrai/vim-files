#!/bin/sh
set -e

cd ~/.vim_runtime

echo 'set runtimepath+=~/.vim_runtime

source ~/.vim_runtime/vimrcs/basic.vim
source ~/.vim_runtime/vimrcs/filetypes.vim
source ~/.vim_runtime/vimrcs/plugins_config.vim
source ~/.vim_runtime/vimrcs/extended.vim
source ~/.vim_runtime/vimrcs/custom_methods.vim

try
source ~/.vim_runtime/my_configs.vim

if has('python3')
	source ~/.vim_runtime/vimrcs/python_functions.vim
else
	echo ('Please install python 3.5')
	finish
endif

catch
endtry' > ~/.vimrc

# Removing Vundle
rm -rf ~/.vim/autoload/plug.vim

# Cloning Vundle
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo "Installed the Ultimate Vim configuration successfully! Enjoy :-)"
