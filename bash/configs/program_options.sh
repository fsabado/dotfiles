#!/bin/bash

#Less
# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

#ls
# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

#ls color
alias ls='ls --color=auto'
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'

# some more ls aliases
alias ll='ls -alh --color=auto'
alias la='ls -A --color=auto'
alias l='ls -CFlh --color=auto'
alias woo='fortune --color=auto'
alias lsd="ls -alF | grep /$"
alias lo="ls -o --color=auto"
alias lh="ls -lh --color=auto"
alias sl="ls --color=auto"
alias s="ls --color=auto"
alias ls="ls --color=auto"
