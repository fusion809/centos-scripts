#
# $HOME/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
for i in ~/Shell/*.sh
do
    . "$i"
done
PS1='\[\e[0;32m\]\u\[\e[m\] \[\e[1;34m\]\w\[\e[m\] \[\e[1;32m\]\$\[\e[m\] \[\e[1;37m\]'

for i in $HOME/Shell/*.sh
do
    . "$i"
done
