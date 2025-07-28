#
# ~/.bashrc
#


# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias l='ls -la'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

export GOPATH=$HOME/.go/
export RIPGREP_CONFIG_PATH=$HOME/.ripgreprc

# export PS1="\[\e[38;5;39m\]\u\[\e[38;5;45m\]@\[\e[38;5;51m\]\h \[\e[38;5;195m\]\w \[\033[0m\]$ "
