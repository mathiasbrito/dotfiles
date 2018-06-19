#===============================================================================
#
#          FILE: setup.sh
#
#         USAGE: ./setup.sh
#
#   DESCRIPTION: Setup the dotfiles in the system
#
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Mathias Santos de Brito (mbr), mathias.brito@me.com
#  ORGANIZATION: 
#       CREATED: 09.06.2018 22:54:23
#      REVISION: 1
#===============================================================================
#!/usr/bin/env bash



CURRENT_DIR=$(pwd)
PLATFORM_OS=$(uname)

# FONTS
if [ -d "$HOME/.fonts" ]; then
    mv $HOME/.fonts $HOME/.fonts.ori  
fi
ln -s ${CURRENT_DIR}/fonts $HOME/.fonts

if [ -d "$HOME/Library/Fonts" ]; then
    cp  ${CURRENT_DIR}/fonts/* $HOME/Library/Fonts  
fi

fc-cache -f -v
#######

# TMUX
if [ -d $HOME/.tmux ]; then
    mv .tmux .tmux.ori
fi
ln -s  ${CURRENT_DIR}/tmux $HOME/.tmux
 
if [ -f $HOME/.tmux.conf ]; then
    mv $HOME/.tmux.conf $HOME/tmux.conf.ori
fi

if [ "$PLATFORM_OS" == "Darwin" ]; then
    ln -s ${CURRENT_DIR}/tmux/tmux.conf.mac $HOME/.tmux.conf
else
    ln -s ${CURRENT_DIR}/tmux/tmux.conf.linux $HOME/.tmux.conf
fi

######

# BASH
if [ -f $HOME/.bash_profile ]; then
    mv $HOME/.bash_profile $HOME/.bash_profile.ori
fi
ln -s ${CURRENT_DIR}/bash_profile $HOME/.bash_profile

if [ -f $HOME/.bashrc ]; then
    mv $HOME/.bashrc $HOME/.bashrc.ori
fi
ln -s ${CURRENT_DIR}/bashrc.sh $HOME/.bashrc
######

# ZSH

if [ -f $HOME/.zshrc ]; then
    mv $HOME/.zshrc $HOME/.zshrc.ori
fi
ln -s ${CURRENT_DIR}/zshrc $HOME/.zshrc

# VIM
if [ -d $HOME/.vim ]; then
    mv $HOME/.vim $HOME/.vim.ori
fi
if [ -f $HOME/.vimrc ]; then
    mv $HOME/.vimrc $HOME/.vimrc.ori
fi
ln -s ${CURRENT_DIR}/vim $HOME/.vim


### VIM ADDONS ####
# Install plugin manager Pathogen
git clone https://github.com/tpope/vim-pathogen.git /tmp/pathogen
cp -rip /tmp/pathogen/autoload ./vim
mkdir ./vim/bundle

# Powerlevel9k
mkdir -p $HOME/.config/fontconfig/conf.d/
cp ./powerline/font/10-powerline-symbols.conf $HOME/.config/fontconfig/conf.d
git clone https://github.com/bhilburn/powerlevel9k.git $HOME/.powerlevel9k

# TMUX Plugins
mkdir -p $HOME/.tmux/plugins
git clone https://github.com/tmux-plugins/tmux-battery $HOME/.tmux/plugins/tmux-battery

# VIM Plugins
git clone https://github.com/SirVer/ultisnips.git vim/bundle/ultisnips
git clone https://github.com/honza/vim-snippets.git vim/bundle/vimsnippets
git clone https://github.com/Yggdroot/indentLine.git vim/bundle/indentline
git clone https://github.com/tpope/vim-fugitive.git vim/bundle/fugitive
git clone https://github.com/airblade/vim-gitgutter vim/bundle/vim-gutter
git clone https://github.com/scrooloose/nerdtree.git vim/bundle/nerdtree
git clone https://github.com/w0rp/ale.git vim/bundle/ale
git clone https://github.com/junegunn/fzf.git vim/bundle/fzf
git clone https://github.com/junegunn/fzf.vim.git vim/bundle/fzf.vim
git clone https://github.com/itchyny/lightline.vim.git vim/bundle/lightline
git clone https://github.com/tpope/vim-surround.git vim/bundle/surround
git clone https://github.com/WolfgangMehner/bash-support.git vim/bundle/bash-support
git clone https://github.com/Valloric/YouCompleteMe.git vim/bundle/YouCompleteMe
git clone https://github.com/vim-airline/vim-airline vim/bundle/vim-airline
git clone https://github.com/rhysd/vim-grammarous.git vim/bundle/vim-grammarous
cd vim/bundle/YouCompleteMe; git submodule update --init --recursive; ./install.py; cd -;


#####
