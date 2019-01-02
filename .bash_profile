source $HOME/.bashrc

export VISUAL=vim
export EDITOR="$VISUAL"

export GOPATH=$HOME/go
export PATH=$PATH:$(go env GOPATH)/bin

