#!/bin/bash
# Export shell script variables
export GHUB=$HOME/GitHub
export SH=$GHUB/centos-scripts

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
  git clone https://github.com/fusion809/centos-scripts $SH
elif isinstalled curl; then
  curl -sL https://github.com/fusion809/centos-scripts/archive/master.tar.gz | tar -xz --transform=s/centos-scripts-master/centos-scripts
elif isinstalled wget; then
  wget -cqO- https://github.com/fusion809/centos-scripts/archive/master.tar.gz | tar -xz --transform=s/centos-scripts-master/centos-scripts
fi

# Copy across
cp -a $SH/{Shell,.*rc} ~/
sudo cp -a $SH/root/{Shell,.*rc} /root/
