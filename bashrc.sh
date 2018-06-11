#!/usr/bin/env bash

if [ -d "$HOME/Library/Python/2.7/bin" ]; then
    PATH="$HOME/Library/Python/2.7/bin:$PATH"
fi

PLATFORM_OS=$(uname)
DOTFILES_DIR=$HOME/.dotfiles

export COLORTERM=truecolor
export CLICOLOR=1
export PS1="\[\033[38;5;223m\]\u\[\033[m\]@\[\033[38;5;223m\]\h:\[\033[38;5;166m\]\w\[\033[m\]\$ "

[ -z "$TMUX"  ] && { tmux attach -t local || exec tmux new-session -s local && exit;}

# macos specific
if [ "$PLATFORM_OS" == "Darwin" ]; then
    export LSCOLORS="gxBxhxDxfxhxhxhxhxcxcx"
else
    export LS_COLORS='di=36:ln=1;31:so=37:pi=1;33:ex=35:bd=37:cd=37:su=37:sg=37:tw=32:ow=32'
fi

# Enable Powerline
# Requires coreutils (macOS: brew install coreutils)
POWERLINE_BASH_CONTINUATION=1
POWERLINE_BASH_SELECT=1
powerline-daemon -q
. ${DOTFILES_DIR}/powerline/powerline/bindings/bash/powerline.sh
# setup tmux
powerline-config tmux setup

#
# Aliases
alias l="ls -laG"
