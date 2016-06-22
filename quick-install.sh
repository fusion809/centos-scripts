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
# Create GitHub directory
if ! [[ -d $HOME/GitHub ]]; then
  mkdir $HOME/GitHub
fi

# Get openssh, if not pre-installed and Zsh
sudo yum install -y git openssh zsh

# Clone centos-scripts repo
if ! [[ -d $HOME/GitHub/centos-scripts ]] || ! [[ -d $HOME/GitHub/mine/centos-scripts ]]; then
  git clone https://github.com/fusion809/centos-scripts $HOME/GitHub/mine/centos-scripts
  # Copy across
  cp -a $HOME/GitHub/mine/centos-scripts/{Shell,.bashrc,.zshrc} $HOME/
  sudo cp -a $HOME/GitHub/mine/centos-scripts/root/{Shell,.bashrc,.zshrc} /root/
elif [[ -d $HOME/GitHub/centos-scripts ]]; then
  cd $HOME/GitHub/centos-scripts
  git pull origin master
  cd -
  # Copy across
  cp -a $HOME/GitHub/centos-scripts/{Shell,.bashrc,.zshrc} $HOME/
  sudo cp -a $HOME/GitHub/centos-scripts/root/{Shell,.bashrc,.zshrc} /root/
elif [[ -d $HOME/GitHub/mine/centos-scripts ]]; then
  cd $HOME/GitHub/mine/centos-scripts
  git pull origin master
  cd -
  # Copy across
  cp -a $HOME/GitHub/mine/centos-scripts/{Shell,.bashrc,.zshrc} $HOME/
  sudo cp -a $HOME/GitHub/mine/centos-scripts/root/{Shell,.bashrc,.zshrc} /root/
fi

if ! [[ -d $HOME/.oh-my-zsh ]]; then
  # git clone oh-my-zsh
  git clone https://github.com/robbyrussell/oh-my-zsh $HOME/.oh-my-zsh
else
  cd $HOME/.oh-my-zsh
  git pull origin master
  cd -
fi

if ! [[ -d $HOME/GitHub/zsh-theme ]] || ! [[ -d $HOME/GitHub/mine/zsh-theme ]]; then
# Get my self-made zsh-themes
  git clone https://github.com/fusion809/zsh-theme $HOME/GitHub/mine/zsh-theme
  cp -a $HOME/GitHub/mine/zsh-theme/*.zsh-theme $HOME/.oh-my-zsh/themes/
else
  cd $HOME/GitHub/{,mine/}zsh-theme
  git pull origin master
  cd -
  cp -a $HOME/GitHub/{,mine/}zsh-theme/*.zsh-theme $HOME/.oh-my-zsh/themes/
fi

if ! [[ -d $HOME/.oh-my-zsh/plugins/zsh-syntax-highlighting ]]; then
  # Get zsh-syntax-highlighting
  git clone https://github.com/zsh-users/zsh-syntax-highlighting $HOME/.oh-my-zsh/plugins/zsh-syntax-highlighting
fi

if ! [[ -d $HOME/.oh-my-zsh/plugins/zsh-history-substring-search ]]; then
  git clone https://github.com/zsh-users/zsh-history-substring-search $HOME/.oh-my-zsh/plugins/zsh-history-substring-search
fi

# Change default login shell to Zsh
chsh -s /bin/zsh
sudo chsh -s /bin/zsh
/bin/zsh
