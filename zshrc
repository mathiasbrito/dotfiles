ZLE_RPROMPT_INDENT=0
. $HOME/.bashrc

# vi mode
bindkey -v
# Bin ctrl+R in vi mode
bindkey '^R' history-incremental-pattern-search-backward


# activate Powerlevel9k
source $HOME/.dotfiles/custom_powerlevel9k.zsh-theme
source $HOME/.powerlevel9k/powerlevel9k.zsh-theme
