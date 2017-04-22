# Edit OpenBox Keybindings
function obedit {
	atom $HOME/.config/openbox/lxde-rc.xml
}

function opconf {
	openbox --reconfigure
}

for i in $HOME/Shell/programs/*.sh
do
    . "$i"
done
