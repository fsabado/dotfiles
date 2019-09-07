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

PROGRAM_NAME=Git
#Configuration settings
#echo "Setting up ${PROGRAM_NAME}"

#Set path variables here

#Configurations

# The rest of my fun git aliases
GITRC=${SOURCE}
alias edit-gitrc="${EDITOR} ${GITRC}"

alias git-pull='git pull --prune'
alias git-pp='git pull && git push'
alias git-log="git log --graph --pretty=format:'%Cred%h%Creset %an: %s - %Creset %C(yellow)%d%Creset %Cgreen(%cr)%Creset' --abbrev-commit --date=relative"
alias git-push='git push origin HEAD'
alias git-diff='git diff'
alias git-commit='git commit'
alias git-commita='git commit -a'
alias git-co='git checkout'
alias git-cb='git copy-branch-name'
alias git-b='git branch'
alias git-status='git status' # upgrade your git if -sb breaks for you. it's fun.
alias git-ac='git add -A && git commit -m'
alias git-submodule-update='git pull origin master'

# cd to git root directory
alias git-cdgr='cd "$(git root)"'

# Use Git’s colored diff when available
hash git &>/dev/null
if [ $? -eq 0 ]; then
	diff() {
		git diff --no-index --color-words "$@"
	}
fi

#Cleanup
unset SOURCE
unset DIR
unset SCRIPTHOME
unset PROGRAM_NAME
set +o xtrace
