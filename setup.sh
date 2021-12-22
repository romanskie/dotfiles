#!bin/sh

VIM_PATH=$HOME/.vim
CONFIG_PATH=$HOME/.config
DOTFILES_PATH=$HOME/dotfiles

mkdir -p $VIM_PATH
mkdir -p $CONFIG_PATH

ln -s $DOTFILES_PATH/.bashrc $HOME/.bashrc
ln -s $DOTFILES_PATH/.bash_profile $HOME/.bash_profile
ln -s $DOTFILES_PATH/.bashrc_alias $HOME/.bashrc_alias
ln -s $DOTFILES_PATH/.gitconfig $HOME/.gitconfig
ln -s $DOTFILES_PATH/.fonts $HOME/.fonts

ln -s $DOTFILES_PATH/vim/.vimrc $HOME/.vimrc
ln -s $DOTFILES_PATH/vim/nvim $CONFIG_PATH/nvim
ln -s $DOTFILES_PATH/vim/nvim/plugin $VIM_PATH/plugin


