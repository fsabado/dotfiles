#!/bin/bash

# If not running interactively, don't do anything
#TODO: Is this needed here?
[ -z "$PS1" ] && return

#Helper source
include () {
    [[ -f "$1" ]] && source "$1"
}

#External plugins (initialized before)
include ~/.bashrc_local_before

#Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

#Load Components
#Init Bash
source ~/.bash/init.cfg

#Spack setup
#source $HOME/dotfiles/spack/spack.cfg

#External plugins (initialized after)
include ~/.bashrc_local_after

