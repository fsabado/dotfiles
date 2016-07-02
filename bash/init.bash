#!/bin/sh

#Helper source
include () {
    [[ -f "$1" ]] && source "$1"
}

#Aliases
include ~/.bash/aliases.bash

#Environment
include ~/.bash/env.bash

#Functions
include ~/bash/functions.bash

#Prompts
#include ~/.bash/solarized_bash_prompt.bash
include ~/.bash/default_bash_prompt.bash
