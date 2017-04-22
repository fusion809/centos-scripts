function update {
	yum update -y
}

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
