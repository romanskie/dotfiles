#!/bin/bash

ln -s ~/dotfiles/.vimrc ~/.vimrc
ln -s ~/dotfiles/.ideavimrc ~/.ideavimrc
ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf
ln -s ~/dotfiles/.bash_profile ~/.bash_profile
ln -s ~/dotfiles/.bash_aliases ~/.bash_aliases
ln -s ~/dotfiles/.bashrc ~/.bashrc

# Vim (~/.vim/autoload)
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# install tmux plugin manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# install xclip
sudo apt-get install xclip


if [ ! -d "$DIRECTORY" ]; then
    mkdir -p $HOME/dev
fi

source $HOME/.bash_profile
source $HOME/.bashrc
