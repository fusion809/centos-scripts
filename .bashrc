#
<<<<<<< HEAD
# ~/.bashrc
=======
# $HOME/.bashrc
>>>>>>> 093ce61b9b8d44340af45d04cd5bfab1dc1846e0
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
<<<<<<< HEAD
PS1='\[\e[0;32m\]\u\[\e[m\] \[\e[1;34m\]\w\[\e[m\] \[\e[1;32m\]\$\[\e[m\] '

for i in ~/Shell/*.sh
do
    . "$i"
done

=======
PS1='\[\e[0;32m\]\u\[\e[m\] \[\e[1;34m\]\w\[\e[m\] \[\e[1;32m\]\$\[\e[m\] \[\e[1;37m\]'

for i in $HOME/Shell/*.sh
do
    . "$i"
done
>>>>>>> 093ce61b9b8d44340af45d04cd5bfab1dc1846e0
