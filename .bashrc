export TMUX_DEFAULT_SESSION="main"
export VISUAL=vim
export EDITOR="$VISUAL"
#export GOPATH=$HOME/go
#export PATH=$PATH:$(go env GOPATH)/bin
export JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-amd64

if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
  tmux attach-session -t "$TMUX_DEFAULT_SESSION" 2>/dev/null || (tmux new-session -d -s $TMUX_DEFAULT_SESSION && tmux attach-session -t "$TMUX_DEFAULT_SESSION"); return
fi

# Avoid duplicates
export HISTCONTROL=ignoredups:erasedups
# When the shell exits, append to the history file instead of overwriting it
shopt -s histappend

# After each command, append to the history file and reread it
export PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND$'\n'}history -a; history -c; history -r"

## alias stuff
alias prettyXML="python -c 'import sys;import xml.dom.minidom;s=sys.stdin.read();print(xml.dom.minidom.parseString(s).toprettyxml())'"
alias dotfiles='cd ~/dotfiles'
alias dev='cd ~/dev'
alias ping='ping -c 5'
alias c='clear'

## a quick way to get out of current directory ##
alias ..='cd ..'
alias ...='cd ../../../'
alias ....='cd ../../../../'
alias c='clear'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# some tmux aliases
alias tm='tmux'
alias tm-n='tmux new -s'
alias tm-new='tmux new -s'
alias tm-create='tmux new -s'
alias tm-c='tmux new -s'

alias tm-list='tmux ls'
alias tm-l='tmux ls'
alias tm-ls='tmux ls'

alias tm-attach='tmux attach-session -t'
alias tm-a='tmux attach-session -t'

alias tm-kill='tmux kill-session -t'
alias tm-k='tmux kill-session -t'

