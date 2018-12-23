##alias stuff#
alias ls='ls -a'
alias dotfiles='cd ~/dotfiles'
alias dev='cd ~/dev'
alias ping='ping -c 5'

## a quick way to get out of current directory ##
alias ..='cd ..'
alias ...='cd ../../../'
alias ....='cd ../../../../'
alias c='clear'

export VISUAL=vim
export EDITOR="$VISUAL"

export GOPATH=$HOME/dev/go
export PATH=$PATH:$(go env GOPATH)/bin
