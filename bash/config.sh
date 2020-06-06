#!/usr/bin/env bash

#Script Pre-setup
#Print bash commands
#https://stackoverflow.com/questions/5750450/how-can-i-print-each-command-before-executing
#https://wiki.bash-hackers.org/scripting/debuggingtips#use_shell_debug_output
if [ -n "${TRACE}" ]; then
	set -o xtrace
fi
#Get current path
SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
  DIR="$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )"
  SOURCE="$(readlink "$SOURCE")"
  [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done
DIR="$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )"

SCRIPTHOME=$DIR

#########MAIN########

PROGRAM_NAME=Bash
#Configuration settings
#echo "Setting up ${PROGRAM_NAME}"

#Shortcut for editing this file
BASHRCS=${SOURCE}
alias edit-bash-s-rc="${EDITOR} ${BASHRCS}"
alias edit-bashrc="${EDITOR} ${HOME}/.bashrc"

# Bash settings is large, we've divided in in the dotfiles/bash/configs
#Run all the bash configs with *.cfg extension
if [ -d ${DIR}/configs ]; then
	for i in ${DIR}/configs/*.sh; do
		[ -f "$i" ] || break
		#echo "$i"
		. "$i"
	done
fi

#Cleanup
unset SOURCE
unset DIR
unset SCRIPTHOME
unset PROGRAM_NAME
set +o xtrace
