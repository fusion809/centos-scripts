function vd {
        pushd "$1"
        vim
        popd
}

function vbash {
        vim $HOME/.bashrc
}

function vrc {
	vim $HOME/.vimrc
}

function vsh {
        vd "$HOME/Shell"
}
