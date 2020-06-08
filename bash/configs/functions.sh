#!/bin/bash

#-------------------------------------------------------------
# Process/system related functions:
#-------------------------------------------------------------
# RED color
RED="\e[31m"
NC="\e[0m" #Normal, Reset ALL attributes

# all functions here are prepended with f_*. Use this to search for the function

#Very Nice Script for extractions
extract() {
    if [ -f $1 ]; then
        #RPM extract: https://www.cyberciti.biz/tips/how-to-extract-an-rpm-package-without-installing-it.html
        case $1 in
        *.tar.bz2) tar xvjf $1 ;;
        *.tar.gz) tar xvzf $1 ;;
        *.bz2) bunzip2 $1 ;;
        *.dmg) hdiutil mount $1 ;;
        *.rar) unrar x $1 ;;
        *.gz) gunzip $1 ;;
        *.tar) tar xvf $1 ;;
        *.tbz2) tar xvjf $1 ;;
        *.tgz) tar xvzf $1 ;;
        *.zip) unzip $1 ;;
        *.ZIP) unzip $1 ;;
        *.Z) uncompress $1 ;;
        *.7z) 7z x $1 ;;
        *.pax) cat $1 | pax -r ;;
        *.pax.Z) uncompress $1 --stdout | pax -r ;;
        *.rar) unrar x $1 ;;
        *.xz) tar -xJf $1 ;;
        *.rpm) rpm2cpio $1 | cpio -idmv ;;
        *) echo "don't know how to extract '$1'..." ;;
        esac
    else
        echo "'$1' is not a valid file!"
    fi
}

f_my_ps() {
    ps $@ -u $USER -o pid,%cpu,%mem,bsdtime,command
}

f_pp() {
    my_ps f | awk '!/awk/ && $0~var' var=${1:-".*"}
}

# Kill by process name.
f_killps() {
    local pid pname sig="-TERM" # Default signal.
    if [ "$#" -lt 1 ] || [ "$#" -gt 2 ]; then
        echo "Usage: killps [-SIGNAL] pattern"
        return
    fi
    if [ $# = 2 ]; then sig=$1; fi
    for pid in $(my_ps | awk '!/awk/ && $0~pat { print $1 }' pat=${!#}); do
        pname=$(my_ps | awk '$1~var { print $5 }' var=$pid)
        if ask "Kill process $pid <$pname> with signal $sig?"; then
            kill $sig $pid
        fi
    done
}

# Get IP adresses.
f_my_ip() {
    MY_IP=$(/sbin/ifconfig ppp0 | awk '/inet/ { print $2 } ' |
        sed -e s/addr://)
    MY_ISP=$(/sbin/ifconfig ppp0 | awk '/P-t-P/ { print $3 } ' |
        sed -e s/P-t-P://)
}

# Get current host related info.
f_ii() {
    echo -e "\nYou are logged on ${RED}$HOST"
    echo -e "\nAdditionnal information:$NC "
    uname -a
    echo -e "\n${RED}Users logged on:$NC "
    w -h
    echo -e "\n${RED}Current date :$NC "
    date
    echo -e "\n${RED}Machine stats :$NC "
    uptime
    echo -e "\n${RED}Memory stats :$NC "
    free
    my_ip 2>&-
    echo -e "\n${RED}Local IP Address :$NC"
    echo ${MY_IP:-"Not connected"}
    echo -e "\n${RED}ISP Address :$NC"
    echo ${MY_ISP:-"Not connected"}
    echo -e "\n${RED}Open connections :$NC "
    netstat -pan --inet
    echo
}

f_warn() {
    echo "$1" >&2
}

f_die() {
    warn "$1"
    exit 1
}

f_lnif() {
    if [ ! -e $2 ]; then
        ln -s $1 $2
    fi
    if [ -L $2 ]; then
        ln -sf $1 $2
    fi
}

#Use this command to go up different part ex:"up 4" = cd ../../../..
f_up() {
    local d=""
    limit=$1
    for ((i = 1; i <= limit; i++)); do
        d=$d/..
    done
    d=$(echo $d | sed 's/^\///')
    if [ -z "$d" ]; then
        d=..
    fi
    cd $d
}

#netinfo - shows network information for your system
f_netinfo() {
    echo "--------------- Network Information ---------------"
    /sbin/ifconfig | awk /'inet addr/ {print $2}'
    /sbin/ifconfig | awk /'Bcast/ {print $3}'
    /sbin/ifconfig | awk /'inet addr/ {print $4}'
    /sbin/ifconfig | awk /'HWaddr/ {print $4,$5}'
    myip=$(lynx -dump -hiddenlinks=ignore -nolist http://checkip.dyndns.org:8245/ | sed '/^$/d; s/^[ ]*//g; s/[ ]*$//g')
    echo "${myip}"
    echo "---------------------------------------------------"
}

#Universal file opener
f_open() {
    if [ -f $1 ]; then
        gnome-open $1
    else
        echo "File does not exist"
    fi
}

# Simple calculator
f_calc() {
    local result=""
    result="$(printf "scale=10;$*\n" | bc --mathlib | tr -d '\\\n')"
    #						└─ default (when `--mathlib` is used) is 20

    if [[ "$result" == *.* ]]; then
        # improve the output for decimal numbers
        printf "$result" |
            sed -e 's/^\./0./' $(# add "0" for cases like ".5"` \
                -e 's/^-\./-0./'
            ) # add "0" for cases like "-.5"`\
        -e 's/0*$//;s/\.$//' # remove trailing zeros
    else
        printf "$result"
    fi
    printf "\n"
}

# Create a new directory and enter it
f_mkd() {
    mkdir -p "$@" && cd "$@"
}

# Make a temporary directory and enter it
f_tmpd() {
    if [ $# -eq 0 ]; then
        dir=$(mktemp -d) && cd $dir
    else
        dir=$(mktemp -d -t $1.XXXXXXXXXX) && cd $dir
    fi
}

f_fs() {
    if du -b /dev/null >/dev/null 2>&1; then
        local arg=-sbh
    else
        local arg=-sh
    fi
    if [[ -n "$@" ]]; then
        du $arg -- "$@"
    else
        du $arg .[^.]* *
    fi
}

# Get colors in manual pages
man() {
    env \
        LESS_TERMCAP_mb=$(printf "\e[1;31m") \
        LESS_TERMCAP_md=$(printf "\e[1;31m") \
        LESS_TERMCAP_me=$(printf "\e[0m") \
        LESS_TERMCAP_se=$(printf "\e[0m") \
        LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
        LESS_TERMCAP_ue=$(printf "\e[0m") \
        LESS_TERMCAP_us=$(printf "\e[1;32m") \
        command man "$@"
}

# Use feh to nicely view images
f_openImage() {
    local types='*.jpg *.JPG *.png *.PNG *.gif *.GIF *.jpeg *.JPEG'

    cd $(dirname "$1")
    local file=$(basename "$1")

    feh -q $types --auto-zoom \
        --sort filename --borderless \
        --scale-down --draw-filename \
        --image-bg black \
        --start-at "$file"
}

# `tre` is a shorthand for `tree` with hidden files and color enabled, ignoring
# the `.git` directory, listing directories first. The output gets piped into
# `less` with options to preserve color and line numbers, unless the output is
# small enough for one screen.
f_tre() {
    tree -aC -I '.git|node_modules|bower_components' --dirsfirst "$@" | less -FRNX
}

#Check Terminal Emulator
f_container() {
    pid=$$
    while true; do
        pid=$(ps -h -o ppid -p $pid 2>/dev/null)
        case $(ps -h -o comm -p $pid 2>/dev/null) in
        gnome-terminal)
            echo "Running in gnome terminal"
            return
            ;;
        xterm)
            echo "Running in xterm"
            return
            ;;
        rxvt)
            echo "Running in rxvt"
            return
            ;;
        python) if [ ! -z "$(ps -h -o args -p $pid 2>/dev/null | grep guake)" ]; then
            echo "Running in Guake"
            return
        fi ;;
        esac
        [[ $(echo $pid) == 1 ]] && break
    done
}

#Get current script path
#Source: http://stackoverflow.com/questions/242538/unix-shell-script-find-out-which-directory-the-script-file-resides
f_currentPath() {
    # Absolute path to this script, e.g. /home/user/bin/foo.sh
    local SCRIPT=$(readlink -f "$0")
    # Absolute path this script is in, thus /home/user/bin
    local SCRIPTPATH=$(dirname "$SCRIPT")
    echo $SCRIPTPATH
}

# On Linux, you can use ldconfig, which maintains the ld.so configuration and cache, to print out the directories search by ld.so with
# ldconfig -v prints out the directories search by the linker (without a leading tab) and the
# shared libraries found in those directories (with a leading tab); the grep gets the directories.
# Source: http://stackoverflow.com/questions/9922949/how-to-print-the-ldlinker-search-path
f_ld_path() {
    ldconfig -v 2>/dev/null | grep -v ^$'\t'
}

# credit to http://askubuntu.com/a/279014
# Function to display all colors
f_allcolors() {

    for x in 0 1 4 5 7 8; do
        for i in $(seq 30 37); do
            for a in $(seq 40 47); do
                echo -ne "\e[$x;$i;$a""m\\\e[$x;$i;$a""m\e[0;37;40m "
            done
            echo
        done
    done
    echo ""
}

f_timestamp() {
    date +"%m-%d-%Y %T"
}
#Sample output: 11-02-2018 16:02:04

#Check currently used ports
f_checkPorts() {
    sudo lsof -i -P -n | grep LISTEN
}

#Add append parameter to path.
f_addPATH() {
    for ADDPATH in "$@"
    do
        #Set path variables here
        if ! echo ${PATH} | grep -q ${ADDPATH}; then
            export PATH=${ADDPATH}:$PATH
        fi
    done
}

#Remove from path
f_removePATH() {
    for REMOVEPATH in "$@"
    do
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
    for ADDPATH in "$@"
    do
        #Set path variables here
        if ! echo ${LD_LIBRARY_PATH} | grep -q ${ADDPATH}; then
            export LD_LIBRARY_PATH=${ADDPATH}:$LD_LIBRARY_PATH
        fi
    done
}

#Remove from path
f_removeLIBRARY() {
    for REMOVEPATH in "$@"
    do
#        Remove start
        LD_LIBRARY_PATH=$(echo "$LD_LIBRARY_PATH" | sed -e "s|^${REMOVEPATH}:[:]||g")
#        Remove middle
        LD_LIBRARY_PATH=$(echo "$LD_LIBRARY_PATH" | sed "s|[:]${REMOVEPATH}[:]|:|g")
#        Remove end
        LD_LIBRARY_PATH=$(echo "$LD_LIBRARY_PATH" | sed -e "s|[:]${REMOVEPATH}$||g")
    done
    export LD_LIBRARY_PATH

#https://askubuntu.com/questions/76808/how-do-i-use-variables-in-a-sed-command
#https://stackoverflow.com/questions/13210880/replace-one-substring-for-another-string-in-shell-script
}

#Extract rpm file
f_rpmExtract() {
    RPMFILE=$1
    for RPMFILE in "$@"
    do
        rpm2cpio ${RPMFILE} | cpio -idmv
    done
}