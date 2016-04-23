#!/bin/bash
# Export shell script variables
export GHUB=$HOME/GitHub
export SH=$GHUB/centos-scripts
export CS="${SH##*/}"
export URL=https://github.com/fusion809/centos-scripts

# Create GHUB directory
if ! [[ -d $GHUB ]]; then
  mkdir $GHUB
fi

# This function is borrowed from http://unix.stackexchange.com/a/122682/27613
function isinstalled {
  if yum list installed "$@" >/dev/null 2>&1; then
    true
  else
    false
  fi
}

# Get the source
if isinstalled git; then
  git clone $URL $SH
elif isinstalled curl; then
  curl -sL $URL/archive/master.tar.gz | tar -xz --transform=s/$CS-master/$CS -C $GHUB
elif isinstalled wget; then
  wget -cqO- $URL/archive/master.tar.gz | tar -xz --transform=s/$CS-master/$CS -C $GHUB
fi

# Copy across
cp -a $SH/{Shell,.*rc} ~/
sudo cp -a $SH/root/{Shell,.*rc} /root/
