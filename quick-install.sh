#!/bin/bash
export GHUB=$HOME/GitHub
export SH=$GHUB/centos-scripts
if ! [[ -d $GHUB ]]; then
  mkdir $GHUB
fi

git clone https://github.com/fusion809/centos-scripts $SH

# Copy across
cp -a $SH/{Shell,.*rc} ~/
sudo cp -a $SH/root/{Shell,.*rc} /root/
