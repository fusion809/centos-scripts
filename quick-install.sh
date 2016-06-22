#!/bin/bash
# Export shell script variables
export GHUB=$GHUB
export SH=$GHUB/mine/centos-scripts
export CS="${SH##*/}"
export URL=https://github.com/fusion809/centos-scripts

# Create GHUB directory
if ! [[ -d $GHUB ]]; then
  mkdir $GHUB
fi

# Get openssh, if not pre-installed and Zsh
sudo yum install -y git openssh zsh

# Clone centos-scripts repo
if ! [[ -d $GHUB/centos-scripts ]] || ! [[ -d $GHUB/mine/centos-scripts ]]; then
  git clone https://github.com/fusion809/centos-scripts $GHUB/mine/centos-scripts
  # Copy across
  cp -a $GHUB/mine/centos-scripts/{Shell,.bashrc,.zshrc} $HOME/
  sudo cp -a $GHUB/mine/centos-scripts/root/{Shell,.bashrc,.zshrc} /root/
elif [[ -d $GHUB/centos-scripts ]]; then
  cd $GHUB/centos-scripts
  git pull origin master
  cd -
  # Copy across
  cp -a $GHUB/centos-scripts/{Shell,.bashrc,.zshrc} $HOME/
  sudo cp -a $GHUB/centos-scripts/root/{Shell,.bashrc,.zshrc} /root/
elif [[ -d $GHUB/mine/centos-scripts ]]; then
  cd $GHUB/mine/centos-scripts
  git pull origin master
  cd -
  # Copy across
  cp -a $GHUB/mine/centos-scripts/{Shell,.bashrc,.zshrc} $HOME/
  sudo cp -a $GHUB/mine/centos-scripts/root/{Shell,.bashrc,.zshrc} /root/
fi

if ! [[ -d $HOME/.oh-my-zsh ]]; then
  # git clone oh-my-zsh
  git clone https://github.com/robbyrussell/oh-my-zsh $HOME/.oh-my-zsh
else
  cd $HOME/.oh-my-zsh
  git pull origin master
  cd -
fi

if ! [[ -d $GHUB/zsh-theme ]] || ! [[ -d $GHUB/mine/zsh-theme ]]; then
# Get my self-made zsh-themes
  git clone https://github.com/fusion809/zsh-theme $GHUB/mine/zsh-theme
  cp -a $GHUB/mine/zsh-theme/*.zsh-theme $HOME/.oh-my-zsh/themes/
else
  cd $GHUB/{,mine/}zsh-theme
  git pull origin master
  cd -
  cp -a $GHUB/{,mine/}zsh-theme/*.zsh-theme $HOME/.oh-my-zsh/themes/
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
