export PATH="$HOME/bin:$PATH"
export TMUX_DEFAULT_SESSION="main"
export VISUAL=vim
export EDITOR="$VISUAL"
#export JAVA_HOME=$(readlink -f /usr/bin/javac | sed "s:/bin/javac::")

if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
  tmux attach-session -t "$TMUX_DEFAULT_SESSION" 2>/dev/null || (tmux new-session -d -s $TMUX_DEFAULT_SESSION && tmux attach-session -t "$TMUX_DEFAULT_SESSION"); return
fi

# Avoid duplicates
export HISTCONTROL=ignoredups:erasedups

# When the shell exits, append to the history file instead of overwriting it
shopt -s histappend

# use auto cd
shopt -s autocd

# After each command, append to the history file and reread it
export PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND$'\n'}history -a; history -c; history -r"

# include .bashrc_alias if it exists
if [ -f $HOME/.bashrc_alias ]; then
    . $HOME/.bashrc_alias
fi

# include .bashrc_secrets if it exists
if [ -f $HOME/.bashrc_secrets ]; then
    . $HOME/.bashrc_secrets
fi

[ -f $HOME/.fzf.bash ] && source $HOME/.fzf.bash

# If not running interactively, don't do anything
case $- in
  *i*) ;;
    *) return;;
esac

# Path to the bash it configuration
export BASH_IT="$HOME/.bash_it"

# Lock and Load a custom theme file.
# Leave empty to disable theming.
# location /.bash_it/themes/
export BASH_IT_THEME='mbriggs'

# Set this to false to turn off version control status checking within the prompt for all themes
export SCM_CHECK=true

# Load Bash It
source "$BASH_IT"/bash_it.sh

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

export SDKMAN_DIR="/home/rschader/.sdkman"
[[ -s "/home/rschader/.sdkman/bin/sdkman-init.sh" ]] && source "/home/rschader/.sdkman/bin/sdkman-init.sh"

complete -C /home/rschader/bin/terraform terraform

export PATH="/home/rschader/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
