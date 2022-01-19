#!/bin/bash

#Bash Options
#Source:https://www.digitalocean.com/community/tutorials/how-to-use-bash-history-commands-and-expansions-on-a-linux-vps

#History Commands
#history
#history 5 //limit output
#history | grep cd //search history for 'cd'
#!51 run a history number
#!! //execute previous command
#sudo !! //execute previous command with sudo
#arrows keys //Move around up/down on history
# Ctrl-p / Ctrl-n //Move around via pages
# Ctrl-r  //recursive search of history, type the commands; Ctrl-r again to see next result
	#Ctrl-s to move back to previous result
#Ctrl-q to unsuspend the session
#Ctrl-a //move to beginning of Bash line
#Ctrl-y //paste clipboard
#!ssh //execute last command that starts with 'ssh'
#!?search? //execute last command but not necessary to start with 'search'
#^original^replacement^ //execute last command with original replaced with replacement
#!!:s/original/replacement/  //replace the first instance of the search pattern (of previous command)
#!!:gs/original/replacement   //replace globally from original to replacement (of previous command)

#Disable suspend and resume feature
stty -ixon

#Remove the Beeping sound from Bash Shell
setterm -blength 0

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
	xterm-color) color_prompt=yes;;
esac

# Autocorrect typos in path names when using `cd`
shopt -s cdspell

# Remove miscellaenous for unsupported bus
# http://unix.stackexchange.com/questions/230238/starting-x-applications-from-the-terminal-and-the-warnings-that-follow
export NO_AT_BRIDGE=1

#https://www.computerhope.com/unix/uumask.htm
# Return, or set, the value of the system's file mode creation mask.
#u	User (the owner of the file)
#g	Group (any member of the file's defined group)
#o	Other (anyone else)
#a	All (equivalent to ugo)
#"r" for read, "w" for write, and "x" for execute
#+	allow the specified file permissions to be enabled for the specified user classes (permissions that are not specified are unchanged in the mask)
#-	prohibit the specified file permissions from being enabled for the specified user classes (permissions that are not specified are unchanged in the mask)
#=	allow the specified file permissions to be enabled for the specified user classes (permissions not specified will be prohibited by the mask during file creation)
#Multiple changes can be specified by separating multiple sets of symbolic notation with commas (but not spaces!)
#ex: umask u-x,g=r,o+w
#Also be presented by Octal value, 7 - rwx, 0777 -(first zero tells us its octal)
#umask is "subtraction" from default.
#Default is 0666 file, 0777 for directories
umask 022 #set 644 (666 - 022) for files, 755 (777 - 022) for directories

# Sensible Bash - An attempt at saner Bash defaults
# Maintainer: mrzool <http://mrzool.cc>
# Repository: https://github.com/mrzool/bash-sensible
# Version: 0.2.2
# https://github.com/mrzool/bash-sensible/blob/master/sensible.bash
# Unique Bash version check
# Dependencies:
# You have the Bash Completion package installed
if ((BASH_VERSINFO[0] < 4))
then
  echo "sensible.bash: Looks like you're running an older version of Bash."
  echo "sensible.bash: You need at least bash-4.0 or some options will not work correctly."
  echo "sensible.bash: Keep your software up-to-date!"
fi

## GENERAL OPTIONS ##

# Prevent file overwrite on stdout redirection
# Use `>|` to force redirection to an existing file
set -o noclobber

# Update window size after every command
shopt -s checkwinsize

# Automatically trim long paths in the prompt (requires Bash 4.x)
PROMPT_DIRTRIM=2

# Enable history expansion with space
# E.g. typing !!<space> will replace the !! with your last command
bind Space:magic-space

# Turn on recursive globbing (enables ** to recurse all directories)
shopt -s globstar 2> /dev/null

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob;

## SMARTER TAB-COMPLETION (Readline bindings) ##

# Perform file completion in a case insensitive fashion
bind "set completion-ignore-case on"

# Treat hyphens and underscores as equivalent
bind "set completion-map-case on"

# Display matches for ambiguous patterns at first tab press
bind "set show-all-if-ambiguous on"

# Immediately add a trailing slash when autocompleting symlinks to directories
bind "set mark-symlinked-directories on"

## SANE HISTORY DEFAULTS ##

# Append to the history file, don't overwrite it
shopt -s histappend

# Save multi-line commands as one command
shopt -s cmdhist

#enable commands in one terminal to be instantly be available in another,Record each line as it gets issued
PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

# Huge history. Doesn't appear to slow things down, so why not?
HISTSIZE=500000
HISTFILESIZE=100000

# Avoid duplicate entries
HISTCONTROL="erasedups:ignoreboth:ignorespace:ignoredups"

# Don't record some commands
export HISTIGNORE="&:[ ]*:exit:ls:bg:fg:history:clear:cd:cd -:pwd:date:* --help:* -h:pony:pony add *:pony update *:pony save *:pony ls:pony ls *"

# Use standard ISO 8601 timestamp
# %F equivalent to %Y-%m-%d
# %T equivalent to %H:%M:%S (24-hours format)
HISTTIMEFORMAT='%F %T '

# Enable incremental history search with up/down arrows (also Readline goodness)
# Learn more about this here: http://codeinthehole.com/writing/the-most-important-command-line-tip-incremental-history-searching-with-inputrc/
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'
bind '"\e[C": forward-char'
bind '"\e[D": backward-char'

## BETTER DIRECTORY NAVIGATION ##

# Prepend cd to directory names automatically
shopt -s autocd 2> /dev/null
# Correct spelling errors during tab-completion
shopt -s dirspell 2> /dev/null
# Correct spelling errors in arguments supplied to cd
shopt -s cdspell 2> /dev/null

# This defines where cd looks for targets
# Add the directories you want to have fast access to, separated by colon
# Ex: CDPATH=".:~:~/projects" will look for targets in the current working directory, in home and in the ~/projects folder
CDPATH=".:~"

# This allows you to bookmark your favorite places across the file system
# Define a variable containing a path and you will be able to cd into it regardless of the directory you're in
shopt -s cdable_vars

# Examples:
export dotfiles="$HOME/dotfiles"
# export projects="$HOME/projects"
# export documents="$HOME/Documents"
# export dropbox="$HOME/Dropbox"
