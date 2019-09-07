#/usr/bin/env bash

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

PROGRAM_NAME=Anaconda3
#Configuration settings
#echo "Setting up ${PROGRAM_NAME}"

#Shortcut for editing this file
ANACONDA3RC=${SOURCE}
alias edit-programrc="${EDITOR} ${ANACONDA3RC}"

ANACONDA3_HOME=${HOME}/anaconda3

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
#Generate activation commands
__conda_setup="$('${ANACONDA3_HOME}/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "${ANACONDA3_HOME}/etc/profile.d/conda.sh" ]; then
        . "${ANACONDA3_HOME}/etc/profile.d/conda.sh"
    else
        export PATH="${ANACONDA3_HOME}/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

#Cleanup
unset SOURCE
unset DIR
unset SCRIPTHOME
unset PROGRAM_NAME
set +o xtrace
