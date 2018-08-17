function update {
	sudo yum update && sudo yum clean all
}

function yin {
	sudo yum install -y $@
}

alias syiy=yin
alias syi=yin

function ylin {
	sudo yum localinstall -y $@
}

function yrm {
	sudo yum remove -y $@
}

function ybd {
	sudo yum-builddeps $@
}

function ys {
	sudo yum search "$@"
}

alias sys=ys

