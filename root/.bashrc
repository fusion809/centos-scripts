# .bashrc

# User specific aliases and functions

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# Source global definitions
if [ -f /etc/bashrc ]; then
        . /etc/bashrc
fi

<<<<<<< HEAD
for i in ~/Shell/*.sh
=======
for i in $HOME/Shell/*.sh
>>>>>>> 093ce61b9b8d44340af45d04cd5bfab1dc1846e0
do
        . "$i"
done
