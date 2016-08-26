#!/bin/bash

INSTALL_PATH="${HOME}/install"
CURRENT_PATH=`pwd`
if ! [ -d $INSTALL_PATH ]
then
    mkdir ${INSTALL_PATH}
fi

#Install some softwares
echo Y > tmp.file
cat ~/.passwd | sudo -S apt-get install vim < tmp.file
cat ~/.passwd | sudo -S apt-get install tmux < tmp.file

##Install zsh and oh-my-zsh and zsh-plugins
cat ~/.passwd | sudo -S apt-get install zsh < tmp.file
cat ~/.passwd | sudo -S chsh -s /bin/zsh
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
cat ~/.passwd | sudo -S apt-get install autojump < tmp.file

##Install vim plugins
if ! [ -d ~/.vim/plugin ]
then
    mkdir -p ~/.vim/plugin
fi
if ! [ -d ~/.vim/doc ]
then
    mkdir -p ~/.vim/doc
fi

wget http://prdownloads.sourceforge.net/ctags/ctags-5.8.tar.gz -O ctags-5.8.tar.gz
tar -xzvf ctags-5.8.tar.gz -C $INSTALL_PATH
cd ${INSTALL_PATH}/ctags-5.8
cat ~/.passwd | sudo -S ./configure 
cat ~/.passwd | sudo -S make 
cat ~/.passwd | sudo -S make install

#TODO: control ~/.vim/ directory through git

cd $CURRENT_PATH
wget http://www.vim.org/scripts/download_script.php?src_id=19574 -O taglist.zip
unzip taglist.zip -d ${INSTALL_PATH}/taglist
cp ${INSTALL_PATH}/taglist/doc/taglist.txt ~/.vim/doc
cp ${INSTALL_PATH}/taglist/plugin/taglist.vim ~/.vim/plugin

wget http://www.vim.org/scripts/download_script.php\?src_id\=14064 -O ~/.vim/plugin/DoxygenToolkit.vim

#TODO: complete the code to handle the shell arguments 
if [ $0 == '--ssserver' ]
then
    cat ~/.passwd | sudo -S install python-pip
    cat ~/.passwd | sudo -S pip install shadowsocks
fi


#Set the dotfiles
absolute_path=`pwd`/dotfiles
backup_date=`date +%F`

mv ~/.vimrc ~/.vimrc-${backup_date}
mv ~/.zshrc ~/.zshrc-${backup_date}
mv ~/.tmux.conf ~/.tmux.conf-${backup_date}
mv ~/.mytmuxlayout ~/.mytmuxlayout-${backup_date}
mv ~/.octaverc ~/.octaverc-${backup_date}

ln -s ${absolute_path}/.vimrc ~/.vimrc
ln -s ${absolute_path}/.zshrc ~/.zshrc
ln -s ${absolute_path}/.tmux.conf ~/.tmux.conf
ln -s ${absolute_path}/.mytmuxlayout ~/.mytmuxlayout
ln -s ${absolute_path}/.octaverc ~/.octaverc


#Set the recycle bin
if ! [ -d ~/recycle_bin ]
then
    mkdir ~/recycle_bin
fi
tmp="alias rm='python ${CURRENT_PATH}/recycle.py ~/recycle_bin '~ ~/install ~/git' '"
echo $tmp >> ~/.zshrc
source ~/.zshrc


#Delete the install files and folders
rm ctags-5.8.tar.gz
rm taglist.zip
rm tmp.file


#Generate SSH key
ssh-keygen
