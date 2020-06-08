#!/usr/bin/env bash
#Common base methods/settings/configurations
#set -x

#https://www.thegeekdiary.com/how-to-make-alias-command-work-in-bash-script-or-bashrc-file/
# Add the following at the start of the script. Universal when done on base script
shopt -s expand_aliases

#Helper source
include() {
    USAGE='
include <file.sh>
'
    if [ "$#" -lt 1 ]; then
        echo "${USAGE}"
        return
    fi
    #Check parameter is a file, readable, exist. Then sources them
    [[ -f "$1" ]] && [[ -r "${1}" ]] && source "$1"
}

getActualDir() {

    USAGE='
Usage: getActualDir ${BASH_SOURCE[0]}
'
    if [ "$#" -lt 1 ]; then
        echo "${USAGE}"
        return
    fi

    #Get current path
    #    SOURCE="${BASH_SOURCE[0]}"
    SOURCE=$1
    while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
        DIR="$(cd -P "$(dirname "$SOURCE")" >/dev/null 2>&1 && pwd)"
        SOURCE="$(readlink "$SOURCE")"
        [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
    done
    DIR="$(cd -P "$(dirname "$SOURCE")" >/dev/null 2>&1 && pwd)"
    echo "${DIR}"

    #Reference
    #https://stackoverflow.com/questions/35006457/choosing-between-0-and-bash-source
}

#Add append parameter to path.
f_addPATH() {
    for ADDPATH in "$@"; do
        #Set path variables here
        if ! echo ${PATH} | grep -q ${ADDPATH}; then
            export PATH=${ADDPATH}:$PATH
        fi
    done
}

#Remove from path
f_removePATH() {
    for REMOVEPATH in "$@"; do
        #        Remove start
        PATH=$(echo "$PATH" | sed -e "s|^${REMOVEPATH}:[:]||g")
        #        Remove middle
        PATH=$(echo "$PATH" | sed "s|[:]${REMOVEPATH}[:]|:|g")
        #        Remove end
        PATH=$(echo "$PATH" | sed -e "s|[:]${REMOVEPATH}$||g")
    done
    export PATH

    #https://askubuntu.com/questions/76808/how-do-i-use-variables-in-a-sed-command
    #https://stackoverflow.com/questions/13210880/replace-one-substring-for-another-string-in-shell-script
}

#Add append parameter to path.
f_addLIBRARY() {
    for ADDPATH in "$@"; do
        #Set path variables here
        if ! echo ${LD_LIBRARY_PATH} | grep -q ${ADDPATH}; then
            export LD_LIBRARY_PATH=${ADDPATH}:$LD_LIBRARY_PATH
        fi
    done
}

#Remove from path
f_removeLIBRARY() {
    set -x
    for REMOVEPATH in "$@"; do
        #        Remove start
        LD_LIBRARY_PATH=$(echo "$LD_LIBRARY_PATH" | sed -e "s|^${REMOVEPATH}:[:]||g")
        #        Remove middle
        LD_LIBRARY_PATH=$(echo "$LD_LIBRARY_PATH" | sed "s|[:]${REMOVEPATH}[:]|:|g")
        #        Remove end
        LD_LIBRARY_PATH=$(echo "$LD_LIBRARY_PATH" | sed -e "s|[:]${REMOVEPATH}$||g")
    done
    export LD_LIBRARY_PATH
    set +x
    #https://askubuntu.com/questions/76808/how-do-i-use-variables-in-a-sed-command
    #https://stackoverflow.com/questions/13210880/replace-one-substring-for-another-string-in-shell-script
}

#Colors
#https://stackoverflow.com/questions/5947742/how-to-change-the-output-color-of-echo-in-linux
#RED="\e[31m"
# Reset
Color_Off='\033[0m'      # Text Reset
# Regular Colors
Black='\033[0;30m'       # Black
Red='\033[0;31m'         # Red
Green='\033[0;32m'       # Green
Yellow='\033[0;33m'      # Yellow
Blue='\033[0;34m'        # Blue
Purple='\033[0;35m'      # Purple
Cyan='\033[0;36m'        # Cyan
White='\033[0;37m'       # White

# Bold
BBlack='\033[1;30m'      # Black
BRed='\033[1;31m'        # Red
BGreen='\033[1;32m'      # Green
BYellow='\033[1;33m'     # Yellow
BBlue='\033[1;34m'       # Blue
BPurple='\033[1;35m'     # Purple
BCyan='\033[1;36m'       # Cyan
BWhite='\033[1;37m'      # White

# Underline
UBlack='\033[4;30m'      # Black
URed='\033[4;31m'        # Red
UGreen='\033[4;32m'      # Green
UYellow='\033[4;33m'     # Yellow
UBlue='\033[4;34m'       # Blue
UPurple='\033[4;35m'     # Purple
UCyan='\033[4;36m'       # Cyan
UWhite='\033[4;37m'      # White

# Background
On_Black='\033[40m'      # Black
On_Red='\033[41m'        # Red
On_Green='\033[42m'      # Green
On_Yellow='\033[43m'     # Yellow
On_Blue='\033[44m'       # Blue
On_Purple='\033[45m'     # Purple
On_Cyan='\033[46m'       # Cyan
On_White='\033[47m'      # White

# High Intensity
IBlack='\033[0;90m'      # Black
IRed='\033[0;91m'        # Red
IGreen='\033[0;92m'      # Green
IYellow='\033[0;93m'     # Yellow
IBlue='\033[0;94m'       # Blue
IPurple='\033[0;95m'     # Purple
ICyan='\033[0;96m'       # Cyan
IWhite='\033[0;97m'      # White

# Bold High Intensity
BIBlack='\033[1;90m'     # Black
BIRed='\033[1;91m'       # Red
BIGreen='\033[1;92m'     # Green
BIYellow='\033[1;93m'    # Yellow
BIBlue='\033[1;94m'      # Blue
BIPurple='\033[1;95m'    # Purple
BICyan='\033[1;96m'      # Cyan
BIWhite='\033[1;97m'     # White

# High Intensity backgrounds
On_IBlack='\033[0;100m'  # Black
On_IRed='\033[0;101m'    # Red
On_IGreen='\033[0;102m'  # Green
On_IYellow='\033[0;103m' # Yellow
On_IBlue='\033[0;104m'   # Blue
On_IPurple='\033[0;105m' # Purple
On_ICyan='\033[0;106m'   # Cyan
On_IWhite='\033[0;107m'  # White
NC="\e[0m"               #Normal, Reset ALL attributes

#Extra Settings:
include ${BASH_HOME}/configs/functions.sh
include ${BASH_HOME}/configs/aliases.sh
include ${BASH_HOME}/configs/bash_options.sh
include ${BASH_HOME}/configs/editor.sh
include ${BASH_HOME}/configs/env.sh
include ${BASH_HOME}/configs/exports.sh
include ${BASH_HOME}/configs/program_options.sh
include ${BASH_HOME}/configs/prompt.sh
include ${BASH_HOME}/configs/software.sh


