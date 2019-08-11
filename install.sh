#!/bin/bash

#WARNING! THIS DOES NOT WORK PROPERLY ATM

set -o errexit
set -o nounset

println() { printf  "$1\n"; }

cleanup() {
    println ""
    println "some error occured => cleaning up ..."
    println "deleting symlinks ... "
    rm -rf ~/.vimrc
    rm -rf ~/.config/nvim/init.vim
    rm -rf ~/.ideavimrc
    rm -rf ~/.tmux.conf
    rm -rf ~/.bash_profile
    rm -rf ~/.bash_aliases
    rm -rf ~/.bashrc
    rm -rf ~/lsp
    rm -rf ~/.lein
    println "cleanup done"
    exit 1
}

# echo an error message before exiting
trap cleanup EXIT

if [ ! -d "~/.config/nvim" ]; then
    mkdir -p ~/.config/nvim
fi

if [ ! -d "~/lsp" ]; then
    mkdir -p ~/lsp
fi

ln -s ~/dotfiles/nvim/init.vim ~/.config/nvim
ln -s ~/dotfiles/.vimrc ~/.vimrc
ln -s ~/dotfiles/.ideavimrc ~/.ideavimrc
ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf
ln -s ~/dotfiles/.bash_profile ~/.bash_profile
ln -s ~/dotfiles/.bash_aliases ~/.bash_aliases
ln -s ~/dotfiles/.bashrc ~/.bashrc
ln -s ~/dotfiles/.lein ~/.lein

# Neovim
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# install tmux plugin manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
