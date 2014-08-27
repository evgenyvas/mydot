#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '
complete -cf sudo man

# avoid duplicates..
export HISTCONTROL=ignoredups:erasedups  
# append history entries..
shopt -s histappend

# After each command, save and reload history
export PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND$'\n'}history -a; history -c; history -r"

alias tmux='TERM=screen-256color-bce tmux attach || TERM=screen-256color-bce tmux new'
alias ll='ls -la'

#so as not to be disturbed by Ctrl-S ctrl-Q in terminals:
stty -ixon
