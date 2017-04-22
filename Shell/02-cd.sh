function cdm {
	cd $HOME/Music
}

function cdman {
	cd $HOME/Documents/Manpages
}
alias cdmn=cdman

function cdps {
	cd $HOME/ps_mem
}

# Pictures
function cdpi {
	cd $HOME/Pictures/$1
}

function cdi {
	cdpi Icons
}

function cds {
	cdpi Screenshots
}

#- End of Pictures -#

function cdsh {
	cd $SHL/$1
}

# VirtualBox
function cdv {
	cd "$HOME/VirtualBox VMs/$1"
}

function cdvi {
	cdv ISO
}

function cdvbm {
	cd "$HOME/Desktop/VirtualBox machines"
}

alias cdvb=cdvbm
#- End of VirtualBox -#

function cdt {
	cd $HOME/Textbooks
}

for i in $SHL/cd/*.sh
do
	. "$i"
done
