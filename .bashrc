#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias player='mpd && ncmpcpp'
PS0='\n'
PS1='\n┌──(\[\e[1m\]\u\[\e[0m\])-[\[\e[2;3m\]\w\[\e[0m\]]\n└─\$ '
set -o vi
export PATH=$PATH:$HOME/.dotnet/tools:$HOME/.cargo/bin

nitch
