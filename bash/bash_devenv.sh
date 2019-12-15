#
# umask
#
umask 022


#
# Tool options
#
export EDITOR=nvim

#
# history
# - https://www.shellhacks.com/tune-command-line-history-bash/
#
HISTSIZE=10000
HISTFILESIZE=2000000

# Append to history instead of overwrite
shopt -s histappend

# Ignore redundant or space commands
HISTCONTROL=ignoreboth

# Ignore more
HISTIGNORE='ls:ll:pwd:clear:history:gs:ps'

# Multiple commands on one line show up as a single line
shopt -s cmdhist

# Append new history lines, clear the history list, re-read the history list, print prompt.
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

# up/down arrows
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

# term colors w/ tmux
export TERM="screen-256color"

# Fuzzy Finder settings - https://github.com/junegunn/fzf
export FZF_DEFAULT_OPTS='--height 20% --border'
