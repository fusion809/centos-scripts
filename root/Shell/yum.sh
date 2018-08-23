function update {
	yum update -y
}

alias yup=update
alias yuy=update
alias yupy=update

function yin {
	yum install -y $@
}

function yrin {
	yum reinstall -y $@
}

function yrm {
	yum remove -y $@
}

function ylin {
	yum localinstall -y $@
}
