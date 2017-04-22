function vd {
        pushd "$1"
        vim
        popd
}

function vbash {
        vim $HOME/.bashrc
}
function vsh {
        vd "$HOME/Shell"
}
