#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS0='\n'
PS1='\n┌──(\[\e[1m\]\u\[\e[0m\])-[\[\e[2;3m\]\w\[\e[0m\]]\n└─> '

set -o vi

bind "TAB:menu-complete" 

alias ls="ls --color=auto -w55 -h -N"
alias grep="grep --color=auto"
alias wget="wget --hsts-file '$XDG_DATA_HOME'/wget-hsts"
alias htop="htop -t"
alias sudo="doas"

cd () { builtin cd "$@" && ls; }
nitch
ls
