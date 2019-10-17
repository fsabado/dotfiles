#!/bin/bash

# Check if editor exist, these will be replaced in best options
command -v vim >/dev/null 2>&1 && export EDITOR=vim; #1st choice
command -v gedit >/dev/null 2>&1 && export EDITOR=gedit; #2nd choice
command -v atom >/dev/null 2>&1 && export EDITOR=atom; #3rd choice
command -v sublime_text >/dev/null 2>&1 && export EDITOR=sublime_text; #4th choice

alias edit="${EDITOR}"
#Example: edit <filename>
