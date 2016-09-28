#!/bin/sh -e
sudo apt-get install -y git vim
rm -rf ~/.vim/bundle/Vundle.vim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
install -m 644 ${0%/*}/vimrc ~/.vimrc
mkdir -p ~/.vim/backup
vim -E -s -c "source ~/.vimrc" -c PluginInstall -c qa
