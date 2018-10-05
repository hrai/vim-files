echo 'Removing .vim_runtime folder...'
rm -rf ~/.vim_runtime
echo 'Finished removing .vim_runtime folder...'

echo 'How do you want to clone the repo? (s/h)'
read t

if [ "$t" = "s" ]; then
    echo 'Cloning vim-files.git via SSH...'
    git clone https://github.com/hrai/vim-files.git ~/.vim_runtime
    echo 'Finished cloning vim-files.git...'
else
    echo 'Cloning vim-files.git via HTTPS...'
    git clone git@github.com:hrai/vim-files.git ~/.vim_runtime
    echo 'Finished cloning vim-files.git...'
fi

echo 'Installing awesome_vimrc...'
sh ~/.vim_runtime/install_awesome_vimrc.sh
echo 'Finished installing awesome_vimrc...'
