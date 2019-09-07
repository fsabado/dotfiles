#!/bin/bash

#Easy reload of bashrc
#https://stackoverflow.com/questions/2518127/how-do-i-reload-bashrc-without-logging-out-and-back-in
alias reload-bash="source ~/.bash_profile"
#alias reload-bash-clean="exec ${BASH}"

# Temporarily disable bash alias
## call alias with a backslash ##
#\c
#unalias aliasname


#Editing
alias edit-bashrc="${EDITOR} ~/.bashrc"
alias edit-aliases="${EDITOR} ~/dotfiles/bash/configs/aliases.cfg"
alias edit-env="${EDITOR} ~/dotfiles/bash/configs/env.cfg"
alias edit-functions="${EDITOR} ~/dotfiles/bash/configs/functions.cfg"
alias edit-bash-options="${EDITOR} ~/dotfiles/bash/configs/functions.cfg"

#Files/Folders
alias mkdir='mkdir -p -v'
alias mv='mv -iv'
alias rm='rm -Iv --one-file-system --preserve-root' #prevent any issues with removal

#Search text
alias search-text='grep -rnw . -e ' #include the pattern

#platform='unknown'
#unamestr=`uname`
#if [[ "$unamestr" == 'Linux' ]]; then
#    platform='linux'
#    # some more ls aliases
#    alias ll='ls -alh --color=auto'
#    alias la='ls -A --color=auto'
#    alias l='ls -CFlh --color=auto'
#    alias woo='fortune --color=auto'
#    alias lsd="ls -alF | grep /$"
#    alias lo="ls -o --color=auto"
#    alias lh="ls -lh --color=auto"
#    alias sl="ls --color=auto"
#    alias s="ls --color=auto"
#    alias ls="ls --color=auto"
#elif [[ "$unamestr" == 'Darwin' ]]; then
#    platform='Mac'
#    # some more ls aliases
#    export CLICOLOR=1
#    alias ll='ls -alh -G'
#    alias la='ls -A -G'
#    alias l='ls -CFlh -G'
#    alias woo='fortune -G'
#    alias lsd="ls -alF | grep /$"
#    alias lo="ls -o -G"
#    alias lh="ls -lh -G"
#    alias sl="ls -G"
#    alias s="ls -G"
#    alias ls="ls -G"
#fi

# Directory navigation aliases
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ~="cd ~" #`cd` is probably faster
alias -- -="cd -"

#Temp for Python shortcut
alias py="python2.7"

# This is GOLD for finding out what is taking so much space on your drives!
alias diskspace="du -S | sort -n -r |more"

# Command line mplayer movie watching for the win.
alias mp="mplayer -fs"

# Show me the size (sorted) of only the folders in this directory
alias folders="find . -maxdepth 1 -type d -print | xargs du -sk | sort -rn"

# This will keep you sane when you're about to smash the keyboard again.
alias frak="fortune"

# copy working directory
alias cpwd='pwd | tr -d "\r\n" | xclip -selection clipboard'

# Shortcuts
alias dl="cd ~/Downloads"
alias g="git"
alias h="history"
alias gc=". /usr/local/bin/gitdate && git commit -v "
alias j="jobs"
alias cls='clear'
alias c='clear'

# Enable aliases to be sudo’ed
alias sudo='sudo '

# IP addresses
alias pubip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="sudo ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1'"
alias ips="sudo ifconfig -a | grep -o 'inet6\? \(addr:\)\?\s\?\(\(\([0-9]\+\.\)\{3\}[0-9]\+\)\|[a-fA-F0-9:]\+\)' | awk '{ sub(/inet6? (addr:)? ?/, \"\"); print }'"

# copy file interactive
alias cp='cp -i'

# move file interactive
alias mv='mv -i'

#Show open ports
alias ports='netstat -tulanp'
