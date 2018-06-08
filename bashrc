alias ls="ls --color"

export PS1="\[\033[38;5;223m\]\u\[\033[m\]@\[\033[38;5;223m\]\h:\[\033[38;5;166m\]\w\[\033[m\]\$ "
export LS_COLORS='di=38;5;109;1:fi=0:ln=38;5;167:pi=5:so=5:bd=5:cd=5:or=38;5;167;4m:mi=0:ex=38;5;142:*.rpm=90'

[ -z "$TMUX"  ] && { tmux attach -t local || exec tmux new-session -s local && exit;}
