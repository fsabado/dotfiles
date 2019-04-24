#!/bin/sh

#variables
userName=$2
displayNumber=$4

export HOME=/home/$userName
export DISPLAY=:$displayNumber
export PATH="/bin:/usr/bin"

firefox 0<&- &>/dev/null &

exit 0
