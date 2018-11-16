#!/bin/bash

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

#External plugins (initialized after)
include ~/.bashrc_local_after


