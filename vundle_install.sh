#!/bin/sh

VUNDLE_INSTALL_LOCATION=$HOME/.vim/bundle/Vundle.vim
if [ ! -d $VUNDLE_INSTALL_LOCATION ]; then
    echo "Vundle not found, installing in $VUNDLE_INSTALL_LOCATION"
    git clone https://github.com/VundleVim/Vundle.vim.git $VUNDLE_INSTALL_LOCATION
fi

vim +PluginInstall +qall
