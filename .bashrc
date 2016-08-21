# Terminal colors
        RED="\[\033[0;31m\]"
     ORANGE="\[\033[0;33m\]"
     YELLOW="\[\033[0;33m\]"
      GREEN="\[\033[0;32m\]"
       BLUE="\[\033[0;34m\]"
  LIGHT_RED="\[\033[1;31m\]"
LIGHT_GREEN="\[\033[1;32m\]"
      WHITE="\[\033[1;37m\]"
 LIGHT_GRAY="\[\033[0;37m\]"
 COLOR_NONE="\[\e[0m\]"

# Basic environment
export PS1="${GREEN}\u@\h ${ORANGE}\W ${RED}$ ${COLOR_NONE}"
export EDITOR=/usr/bin/vim

# PATH munging
# See http://tldp.org/LDP/Bash-Beginners-Guide/html/sect_11_02.html

EGREP=$(which egrep)

function pathmunge {
    if ! echo $PATH | $EGREP -q "(^|:)$1($|:)" ; then
        if [ "$2" = "after" ] ; then
            PATH=$PATH:$1
        else
            PATH=$1:$PATH
        fi
    fi
}

pathmunge /sbin
pathmunge /usr/sbin
pathmunge /usr/local/sbin
pathmunge /bin
pathmunge /usr/bin
pathmunge /usr/local/bin
pathmunge "$HOME/bin"

export PATH
unset pathmunge

# Aliases

if [[ "$(uname)" == "Darwin" ]]; then
    alias l="ls -FG"
    alias ls="ls -FG"
    alias ll="ls -lhFG"
    alias la="ls -ahFG"
    alias lal="ls -lahFG"
    alias d="pwd && echo && ls -FG"
    alias sublime="open -a 'Sublime Text.app'"
else
    alias l="ls --color -F"
    alias ls="ls --color -F"
    alias ll="ls --color -lhF"
    alias la="ls --color -ahF"
    alias lal="ls --color -lahF"
    alias d="pwd && echo && ls --color -F"
fi
    
alias ..='cd ..'
alias untar='tar -xvf'
alias rm='rm -i'
alias beep="echo -e '\a'"
alias pgrep='ps aux | grep'
alias gs='git status'
alias hgrep='history | grep'
alias nuke='pkill -u $(whoami)'

if [ -e ~/.bash_local ]; then
    source ~/.bash_local
fi

if [ -f ~/.git-completion.bash ]; then
    source ~/.git-completion.bash
fi










