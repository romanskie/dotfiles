export PATH="$HOME/bin:$PATH"
export EDITOR=vim
#export JAVA_HOME=$(readlink -f /usr/bin/javac | sed "s:/bin/javac::")

# Avoid duplicates
export HISTCONTROL=ignoredups:erasedups

# When the shell exits, append to the history file instead of overwriting it
shopt -s histappend

# use auto cd
shopt -s autocd

# After each command, append to the history file and reread it
export PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND$'\n'}history -a; history -c; history -r"

if [ -f $HOME/.bashrc_alias ]; then
    . $HOME/.bashrc_alias
fi

if [ -f $HOME/.bashrc_secrets ]; then
    . $HOME/.bashrc_secrets
fi

if [ -f $HOME/.fzf.bash ]; then
    . $HOME/.fzf.bash
fi

# Path to the bash it configuration
export BASH_IT="$HOME/.bash_it"

# Lock and Load a custom theme file.
# Leave empty to disable theming.
# location /.bash_it/themes/
export BASH_IT_THEME='mbriggs'

# Set this to false to turn off version control status checking within the prompt for all themes
export SCM_CHECK=true

export SDKMAN_DIR="/home/rschader/.sdkman"
[[ -s "/home/rschader/.sdkman/bin/sdkman-init.sh" ]] && source "/home/rschader/.sdkman/bin/sdkman-init.sh"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# If not running interactively, don't do anything
case $- in
  *i*) ;;
    *) return;;
esac

# Load Bash It
if [ -f $BASH_IT/bash_it.sh ]; then
    . $BASH_IT/bash_it.sh
fi

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
