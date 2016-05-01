#!/bin/bash

#set the dofiles
absolute_path=`pwd`/dotfiles
backup_date=`date +%F`

mv ~/.vimrc ~/.vimrc-${backup_date}
mv ~/.zshrc ~/.zshrc-${backup_date}
mv ~/.xmodmaprc ~/.xmodmaprc-${backup_date}
mv ~/.tmux.conf ~/.tmux.conf-${backup_date}
mv ~/.mytmuxlayout ~/.mytmuxlayout-${backup_date}

#create soft link
ln -s ${absolute_path}/.vimrc ~/.vimrc
ln -s ${absolute_path}/.zshrc ~/.zshrc
#ln -s ${absolute_path}/.xmodmaprc ~/.xmodmaprc
ln -s ${absolute_path}/.tmux.conf ~/.tmux.conf
ln -s ${absolute_path}/.mytmuxlayout ~/.mytmuxlayout
