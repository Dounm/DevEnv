#!/bin/bash

set -x
set -e

#Set the dotfiles

backup_date=`date +%F`
file_path=/data/niuchong/git/DevEnv/dotfiles

LinkDotFile() {
  if [[ -e ~/$1 ]];
  then
    mv -f ~/$1 ~/$1.$backup_date
  fi
  ln -s ${file_path}/$1 ~/$1
}


LinkDotFile .vimrc
LinkDotFile .zshrc
LinkDotFile .zsh_aliases
LinkDotFile .tmux.conf
LinkDotFile .mytmuxlayout
LinkDotFile .asynctasks.ini
