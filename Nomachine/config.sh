#!/usr/bin/env bash

#Script Pre-setup
#Print bash commands
#https://stackoverflow.com/questions/5750450/how-can-i-print-each-command-before-executing
#https://wiki.bash-hackers.org/scripting/debuggingtips#use_shell_debug_output
if [ ! -z ${TRACE+x} ]; then
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

PROGRAM_NAME=Nomachine
#Configuration settings
#echo "Setting up ${PROGRAM_NAME}"

#Shortcut for editing this file
NOMACHINERC=${SOURCE}
alias edit-nxrc="${EDITOR} ${NOMACHINERC}"

#Exit early if NX isn't installed
if [ ! -d "/usr/NX" ]; then
	exit 1
fi

#Set path variables here
#export PATH=$SCRIPTHOME/bin:$PATH

# Aliases
alias edit-nxnode="sudo vim /usr/NX/etc/node.cfg"
alias edit-nxserver="sudo vim /usr/NX/etc/server.cfg"
alias nx-vgl="/usr/NX/scripts/vgl/vglrun"
alias nxserver-start="/etc/NX/nxserver --start"
alias nxserver-stop="/etc/NX/nxserver --stop"
alias nxserver-shutdown="/etc/NX/nxserver --shutdown"
alias nxserver-restart="/etc/NX/nxserver --restart"

#Cleanup
unset SOURCE
unset DIR
unset SCRIPTHOME
unset PROGRAM_NAME
set +o xtrace
