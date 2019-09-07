#!/bin/bash

# Check if editor exist, these will be replaced in best options
command -v gedit >/dev/null 2>&1 && export EDITOR=gedit;
command -v atom >/dev/null 2>&1 && export EDITOR=atom;

alias edit="${EDITOR}"
#Example: edit <filename>
