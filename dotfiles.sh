#!/bin/bash

set -x
set -e

#Set the dotfiles

backup_date=`date +%F`
TryBackupExistedDotFiles() {
  if [ -f $1 ]
  then
    mv $1 $1-${backup_date}
  fi
}


absolute_path=`pwd`/dotfiles

TryBackupExistedDotFiles ~/.vimrc
TryBackupExistedDotFiles ~/.zshrc
TryBackupExistedDotFiles ~/.tmux.conf
TryBackupExistedDotFiles ~/.octaverc.conf
TryBackupExistedDotFiles ~/.mytmuxlayout
TryBackupExistedDotFiles ~/.octaverc


ln -s ${absolute_path}/.zshrc ~/.zshrc
ln -s ${absolute_path}/.tmux.conf ~/.tmux.conf
ln -s ${absolute_path}/.mytmuxlayout ~/.mytmuxlayout
ln -s ${absolute_path}/.octaverc ~/.octaverc
ln -s ${absolute_path}/.vimrc ~/.vimrc
ln -s `pwd`/recycle.py ~/.recycle.py

echo > ~/.specific_zshrc
