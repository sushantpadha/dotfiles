# ===================================================================
# HISTORY SETTINGS
# ===================================================================
export HISTFILE=~/.bash_history
HISTSIZE=50000
HISTFILESIZE=50000
HISTCONTROL=erasedups
shopt -s histappend
PROMPT_COMMAND="history -a; history -n; $PROMPT_COMMAND"
