#!/usr/bin/env bash

set -ex

#Set the dotfiles

BASE_PATH=`pwd`
INSTALL_PATH=$HOME/install
if ! [ -d $INSTALL_PATH ]
then
  mkdir $INSTALL_PATH
fi


InstallZshRelated() {
  sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  ZSH_CUSTOM=$HOME/.oh-my-zsh/custom
  git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
}

TryBackupExistedDotFiles() {
  if [ -f $1 ]
  then
    mv $1 $1-${backup_date}
  fi
}

InstallDotFiles() {
  backup_date=`date +%F`
  absolute_path=$BASE_PATH/dotfiles
  
  TryBackupExistedDotFiles ~/.vimrc
  TryBackupExistedDotFiles ~/.zshrc
  TryBackupExistedDotFiles ~/.tmux.conf
  TryBackupExistedDotFiles ~/.mytmuxlayout
  
  
  ln -s ${absolute_path}/.zshrc ~/.zshrc
  ln -s ${absolute_path}/.tmux.conf ~/.tmux.conf
  ln -s ${absolute_path}/.mytmuxlayout ~/.mytmuxlayout
  ln -s ${absolute_path}/.vimrc ~/.vimrc
  ln -s `pwd`/recycle.py ~/.recycle.py
  
  echo > ~/.specific_zshrc
  echo > ~/.specific_vimrc
}

GenerateSSHkey() {
  if ! [ -e ~/.ssh/id_rsa.pub ]
  then
    ssh-keygen
  fi
}

InstallConda() {
  cd $INSTALL_PATH
  curl -LO https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
  bash Miniconda3-latest-Linux-x86_64.sh

  DOTFILE_PATH=$BASE_PATH/dotfiles
  ln -s $DOTFILE_PATH/.condarc ~/.condarc
  conda clean -i
}

ConfigConda() {
  conda install -c conda-forge vim
  conda install -c conda-forge git
  conda install -c conda-forge tmux
  conda install -c conda-forge htop
  conda install -c conda-forge gdb
  conda install -c conda-forge autopep8
  conda install -c conda-forge curl
  conda install -c conda-forge gpustat
  conda install -c conda-forge pylint
  conda install -c conda-forge ripgrep
}

InstallAutoJump() {
  cd $INSTALL_PATH
  git clone git://github.com/wting/autojump.git
  cd autojump
  ./install.py
}

InstallGDBPrettyPrint() {
  conda install -c conda-forge svn
  cd $INSTALL_PATH
  mkdir gdb-printer && cd gdb-printer && svn co svn://gcc.gnu.org/svn/gcc/trunk/libstdc++-v3/python
  DOTFILE_PATH=$BASE_PATH/dotfiles
  ln -s $DOTFILE_PATH/.gdbinit ~/.gdbinit
}

InstallVimRelated() {
  # ln -s $BASE_PATH/dotfiles/vim-templates ~/.vim/templates

  FTPLUGIN_PATH=~/.vim/after/
  if ! [ -d $FTPLUGIN_PATH ]
  then
    mkdir $FTPLUGIN_PATH
  fi
  ln -s $BASE_PATH/dotfiles/vim-ftplugin $FTPLUGIN_PATH/ftplugin
}


## Main

# InstallZshRelated
# InstallDotFiles
# GenerateSSHkey
# InstallConda
# ConfigConda
# InstallAutoJump
# InstallGDBPrettyPrint
InstallVimRelated
