#!/bin/bash

ln -s ~/dotfiles/.vimrc ~/.vimrc
ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf
ln -s ~/dotfiles/.bash_profile ~/.bash_profile

#mkdir -p ~/.config/nvim
#ln -s ~/dotfiles/nvim/init.vim ~/.config/nvim

# Vim (~/.vim/autoload)
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Neovim (~/.local/share/nvim/site/autoload)
#curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
#    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim


if [ ! -d "$DIRECTORY" ]; then
    mkdir -p $HOME/dev
fi

echo 'source $HOME/.bash_profile' >> $HOME/.bashrc
source $HOME/.bash_profile
source $HOME/.bashrc
