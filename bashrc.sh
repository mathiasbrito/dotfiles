#!/usr/bin/env bash

PLATFORM_OS=$(uname)
DOTFILES_DIR=$HOME/.dotfiles

export LS_COLORS='di=36:ln=1;31:so=37:pi=1;33:ex=35:bd=37:cd=37:su=37:sg=37:tw=32:ow=32'
export LSCOLORS="gxBxhxDxfxhxhxhxhxcxcx"
export COLORTERM=truecolor
export CLICOLOR=1

[ -z "$TMUX"  ] && { tmux attach -t local || exec tmux new-session -s local && exit;}


# macos specific
if [ "$PLATFORM_OS" = "Darwin" ]; then
    # Use gls if available
    if [ -x "$(command -v gls)" ] ; then
        alias ls="gls -F --color"
        alias ll="ls -lF --color"
    fi
else
    # Aliases
    alias ll="ls -lF --color"
    alias icloud="cd ~/Library/Mobile\ Documents/com~apple~CloudDocs/"
fi


