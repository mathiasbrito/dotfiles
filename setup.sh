#!/usr/bin/env bash

# FONTS
if [ -d "~/.fonts" ]; then
    mv ~/.fonts ~/.fonts.ori  
fi
ln -s ./fonts/ ~/.fonts
fc-cache -f -v
#######

# TMUX
if [ -f ~/.tmux.conf ] then
    mv ~/.tmux.conf ~/tmux.conf.ori
fi    
ln -s tmux.conf ~/.tmux.conf
######

# BASH
if [ -f ~/.bash_profile ] then
    mv ~/.bash_profile ~/.bash_profile.ori
fi
ln -s bash_profile ~/.bash_profile

if [ -f ~/.bashrc ] then
    mv ~/.bashrc ~/.bashrc.ori
fi
ln -s bashrc ~/.bashrc
######

# VIM
if [ -d ~/.vim ] then
    mv ~/.vim ~/.vim.ori
fi
ln -s ./vim ~/.vim


### VIM ADDONS ####
# istall plugin manager Pathogen
git clone https://github.com/tpope/vim-pathogen.git /tmp/pathogen
cp -rip /tmp/pathogen/autoload ./vim
mkdir ./vim/bundle

#Color Schemes
git clone https://github.com/morhetz/gruvbox.git ~/.vim/bundle/gruvbox

#Plugins
git clone https://github.com/Yggdroot/indentLine.git ./vim/bundle/indentline
git clone https://github.com/tpope/vim-fugitive.git ./vim/bundle/fugitive
git clone https://github.com/airblade/vim-gitgutter ./vim/bundle/vim-gutter
git clone https://github.com/scrooloose/nerdtree.git ./vim/bundle/nerdtree
git clone https://github.com/w0rp/ale.git ./vim/bundle/ale
git clone https://github.com/junegunn/fzf.git vim/bundle/fzf
git clone https://github.com/junegunn/fzf.vim.git vim/bundle/fzf.vim
git clone https://github.com/itchyny/lightline.vim.git vim/bundle/lightline
git clone https://github.com/tpope/vim-surround.git vim/bundle/surround
git clone https://github.com/WolfgangMehner/bash-support.git /tmp/bash-support vim/bundle/bash-support
#####
