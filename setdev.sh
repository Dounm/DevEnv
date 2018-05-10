#!/bin/bash

set -x
set -e

INSTALL_PATH="${HOME}/install"
CURRENT_PATH=`pwd`
if ! [ -d $INSTALL_PATH ]
then
    mkdir ${INSTALL_PATH}
fi

PACKAGE_CMD=$0

#Install some softwares
echo Y > tmp.file > /dev/null
if ! type 'tmux'
then
  cat ~/.passwd | sudo -S ${PACKAGE_CMD} install tmux < tmp.file
fi

##Install zsh and oh-my-zsh and zsh-plugins
if ! type 'tmux' > /dev/null
then
  cat ~/.passwd | sudo -S ${PACKAGE_CMD} install zsh < tmp.file
  cat ~/.passwd | sudo -S chsh -s /bin/zsh
  sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
fi

if ! type 'autojump' > /dev/null
then
  cat ~/.passwd | sudo -S ${PACKAGE_CMD} install autojump < tmp.file
fi

#Install ctags
if ! type 'ctags' > /dev/null
then
  wget http://prdownloads.sourceforge.net/ctags/ctags-5.8.tar.gz -O ctags-5.8.tar.gz
  tar -xzvf ctags-5.8.tar.gz -C $INSTALL_PATH
  cd ${INSTALL_PATH}/ctags-5.8
  cat ~/.passwd | sudo -S ./configure 
  cat ~/.passwd | sudo -S make 
  cat ~/.passwd | sudo -S make install
  rm ctags-5.8.tar.gz
fi

#Set the dotfiles

backup_date=`date +%F`
function TryBackupExistedDotFiles() {
  if ! [ -f $0 ]
  then
    mv $0 $0-${backup_date}
  fi
}


absolute_path=`pwd`/dotfiles

TryBackupExistedDotFiles ~/.vimrc
TryBackupExistedDotFiles ~/.zshrc
TryBackupExistedDotFiles ~/.tmux.conf
TryBackupExistedDotFiles ~/.octaverc.conf


ln -s ${absolute_path}/.vimrc ~/.vimrc
ln -s ${absolute_path}/.zshrc ~/.zshrc
ln -s ${absolute_path}/.tmux.conf ~/.tmux.conf
ln -s ${absolute_path}/.mytmuxlayout ~/.mytmuxlayout
ln -s ${absolute_path}/.octaverc ~/.octaverc
echo > ~/.specific_zshrc


#Set the recycle bin
if ! [ -d ~/recycle_bin ]
then
    mkdir ~/recycle_bin
fi
tmp="alias rm='python ${CURRENT_PATH}/recycle.py ~/recycle_bin '~ ~/install ~/git' '"
echo $tmp >> ~/.zshrc
source ~/.zshrc

rm tmp.file

#Generate SSH key
if ! [ -d ~/.ssh ]
then
  ssh-keygen
fi
