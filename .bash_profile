source $HOME/.bashrc
if [ -f ~/.bash_aliases ]; then
    source ~/.bash_aliases
fi

export TMUX_DEFAULT_SESSION="default"

if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
  tmux attach-session -t "$TMUX_DEFAULT_SESSION" 2>/dev/null || (tmux new-session -d -s $TMUX_DEFAULT_SESSION && tmux attach-session -t "$TMUX_DEFAULT_SESSION"); return
fi

export VISUAL=vim
export EDITOR="$VISUAL"

export GOPATH=$HOME/go
export PATH=$PATH:$(go env GOPATH)/bin

export JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-amd64

export PATH="$PATH":/home/rschader/.lsp

export PATH="$PATH":/home/rschader/.bloop

# Avoid duplicates
export HISTCONTROL=ignoredups:erasedups
# When the shell exits, append to the history file instead of overwriting it
shopt -s histappend

# After each command, append to the history file and reread it
export PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND$'\n'}history -a; history -c; history -r"


# tm - create new tmux session, or switch to existing one. Works from within tmux too. (@bag-man)
# `tm` will allow you to select your tmux session via fzf.
# `tm irc` will attach to the irc session (if it exists), else it will create it.

#tm() {
#  [[ -n "$TMUX" ]] && change="switch-client" || change="attach-session"
#  if [ $1 ]; then
#    tmux $change -t "$1" 2>/dev/null || (tmux new-session -d -s $1 && tmux $change -t "$1"); return
#  fi
#  session=$(tmux list-sessions -F "#{session_name}" 2>/dev/null | fzf --exit-0) &&  tmux $change -t "$session" || echo "No sessions found."
#}


