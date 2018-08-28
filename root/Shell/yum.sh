function update {
	yum update -y
}

alias yup=update
alias yuy=update
alias yupy=update

function yin {
	yum install -y "$@"
}

alias yiy=yin

function yrin {
	yum reinstall -y "$@"
}

function yrm {
	yum remove -y "$@"
}

function ylin {
	yum localinstall -y "$@"
}

function ys {
	yum search "$@"
}
