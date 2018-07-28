echo 'Removing .vim_runtime folder...'
rm -rf ~/.vim_runtime
echo 'Finished removing .vim_runtime folder...'

echo 'Cloning vim-files.git...'
git clone --depth=1 git://github.com/hrai/vim-files.git ~/.vim_runtime
echo 'Finished cloning vim-files.git...'

echo 'Installing awesome_vimrc...'
sh ~/.vim_runtime/install_awesome_vimrc.sh
echo 'Finished installing awesome_vimrc...'
