

export EDITOR=/usr/bin/vim

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

alias l="ls --color -F"
alias ls="ls --color -F"
alias ll="ls --color -lhF"
alias la="ls --color -ahF"
alias lal="ls --color -lahF"
alias d="pwd && echo && ls --color -F"
alias rm='rm -i'
alias beep="echo -e '\a'"
alias pgrep='ps aux | grep'
alias gs='git status'















