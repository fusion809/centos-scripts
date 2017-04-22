# GitHub
function cdg {
	cd $GHUB/$1
}

function cdgm {
	cdg mine/$1
}

function cdatin {
	cdgm atom-installer
}

function cdvsin {
	cdgm vscode-installer
}

function cdsc {
	cdgm "scripts/$1"
}

function cdss {
	cdsc centos-scripts
}

alias cdcs=cdss

function cdfgi {
	cdgm fusion809.github.io
}

function cdgf {
	cdgm hugo-website
}

function cdgp {
	cd $PAK/$1
}

alias cdpak=cdgp

function cdgpa {
	cdgp arch-builder
}

alias cdarch=cdgpa
alias cdar=cdgpa
alias cdgab=cdgpa
alias cdpab=cdgpa
alias cdab=cdgpa

function cdgen {
 cdgp gentoo-packer
}

function cdsp {
	cdgp sabayon-packer
}

function cdms {
	cdg moksha-scripts
}

alias cdweb=cdgf
