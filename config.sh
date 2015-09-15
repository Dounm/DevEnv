#!/bin/bash

absolute_path=$(pwd)

rm -rf ~/.vimrc ~/.zshrc ~/.xmodmaprc ~/.tmux.conf ~/.mytmuxlayout

#create soft link
ln -s ${absolute_path}/.vimrc ~/.vimrc
ln -s ${absolute_path}/.zshrc ~/.zshrc
#ln -s ${absolute_path}/.xmodmaprc ~/.xmodmaprc
ln -s ${absolute_path}/.tmux.conf ~/.tmux.conf
ln -s ${absolute_path}/.mytmuxlayout ~/.mytmuxlayout
