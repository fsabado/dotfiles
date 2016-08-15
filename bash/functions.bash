#!/bin/bash


# <! Functions
#-------------------------------------------------------------
# Process/system related functions:
#-------------------------------------------------------------
# RED color
RED="\e[31m"
NC="\e[0m"  #Normal, Reset ALL attributes

#Very Nice Script for extractions
function extract () {
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)   tar xvjf $1    ;;
            *.tar.gz)    tar xvzf $1    ;;
            *.bz2)       bunzip2 $1     ;;
             *.dmg)      hdiutil mount $1 ;;
            *.rar)       unrar x $1     ;;
            *.gz)        gunzip $1      ;;
            *.tar)       tar xvf $1     ;;
            *.tbz2)      tar xvjf $1    ;;
            *.tgz)       tar xvzf $1    ;;
            *.zip)       unzip $1       ;;
             *.ZIP)      unzip $1       ;;
            *.Z)        uncompress $1  ;;
            *.7z)       7z x $1        ;;
            *.pax)      cat $1 | pax -r ;;
            *.pax.Z)    uncompress $1 --stdout | pax -r     ;;
            *.rar)      unrar x $1 ;;
            *.xz)        tar -xJf $1    ;;
            *)           echo "don't know how to extract '$1'..." ;;
        esac
    else
        echo "'$1' is not a valid file!"
    fi
}

function my_ps() {
     ps $@ -u $USER -o pid,%cpu,%mem,bsdtime,command ;
 }

function pp() {
     my_ps f | awk '!/awk/ && $0~var' var=${1:-".*"} ;
 }

# Kill by process name.
function killps(){
    local pid pname sig="-TERM"   # Default signal.
    if [ "$#" -lt 1 ] || [ "$#" -gt 2 ]; then
        echo "Usage: killps [-SIGNAL] pattern"
        return;
    fi
    if [ $# = 2 ]; then sig=$1 ; fi
    for pid in $(my_ps| awk '!/awk/ && $0~pat { print $1 }' pat=${!#} ) ; do
        pname=$(my_ps | awk '$1~var { print $5 }' var=$pid )
        if ask "Kill process $pid <$pname> with signal $sig?"
        then kill $sig $pid
        fi
    done
}


# Get IP adresses.
function my_ip(){
    MY_IP=$(/sbin/ifconfig ppp0 | awk '/inet/ { print $2 } ' | \
    sed -e s/addr://)
    MY_ISP=$(/sbin/ifconfig ppp0 | awk '/P-t-P/ { print $3 } ' | \
    sed -e s/P-t-P://)
}

# Get current host related info.
function ii(){
    echo -e "\nYou are logged on ${RED}$HOSTNAME"
    echo -e "\nUsername ${RED}$USER"
    echo -e "\nAdditional information:$NC\n" ; uname -a
    echo -e "\n${RED}Users logged on:$NC " ; w -h
    echo -e "\n${RED}Current date :$NC " ; date
    echo -e "\n${RED}Machine stats :$NC " ; uptime
    echo -e "\n${RED}Memory stats :$NC " ; free
    my_ip 2>&- ;
    echo -e "\n${RED}Local IP Address :$NC" ; echo ${MY_IP:-"Not connected"}
    echo -e "\n${RED}ISP Address :$NC" ; echo ${MY_ISP:-"Not connected"}
    echo -e "\n${RED}Open connections :$NC "; netstat -pan --inet;
    echo
}


function warn() {
    echo "$1" >&2
}

function die() {
    warn "$1"
    exit 1
}

function lnif() {
    if [ ! -e $2 ] ; then
        ln -s $1 $2
    fi
    if [ -L $2 ] ; then
        ln -sf $1 $2
    fi
}

#Use this command to go up different part ex:"up 4" = cd ../../../..
function up(){
    local d=""
    limit=$1
    for ((i=1 ; i <= limit ; i++))
    do
        d=$d/..
    done
    d=$(echo $d | sed 's/^\///')
    if [ -z "$d" ]; then
        d=..
    fi
    cd $d
}


#netinfo - shows network information for your system
function netinfo ()
{
    echo "--------------- Network Information ---------------"
    /sbin/ifconfig | awk /'inet addr/ {print $2}'
    /sbin/ifconfig | awk /'Bcast/ {print $3}'
    /sbin/ifconfig | awk /'inet addr/ {print $4}'
    /sbin/ifconfig | awk /'HWaddr/ {print $4,$5}'
    myip=`lynx -dump -hiddenlinks=ignore -nolist http://checkip.dyndns.org:8245/ | sed '/^$/d; s/^[ ]*//g; s/[ ]*$//g' `
    echo "${myip}"
    echo "---------------------------------------------------"
}


function open(){
    if [ -f $1 ]
    then
        gnome-open $1
    else
        echo "File does not exist"
    fi
}


# Simple calculator
function calc() {
	local result=""
	result="$(printf "scale=10;$*\n" | bc --mathlib | tr -d '\\\n')"
	#						└─ default (when `--mathlib` is used) is 20

	if [[ "$result" == *.* ]]; then
		# improve the output for decimal numbers
		printf "$result" |
		sed -e 's/^\./0./'		  `# add "0" for cases like ".5"` \
			-e 's/^-\./-0./'	  `# add "0" for cases like "-.5"`\
			-e 's/0*$//;s/\.$//';  # remove trailing zeros
	else
		printf "$result"
	fi
	printf "\n"
}


# Create a new directory and enter it
function mkd() {
	mkdir -p "$@" && cd "$@"
}

# Make a temporary directory and enter it
function tmpd() {
	if [ $# -eq 0 ]; then
		dir=`mktemp -d` && cd $dir
	else
		dir=`mktemp -d -t $1.XXXXXXXXXX` && cd $dir
	fi
}

function fs() {
    if du -b /dev/null > /dev/null 2>&1; then
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
function man() {
	env \
		LESS_TERMCAP_mb=$(printf "\e[1;31m") \
		LESS_TERMCAP_md=$(printf "\e[1;31m") \
		LESS_TERMCAP_me=$(printf "\e[0m") \
		LESS_TERMCAP_se=$(printf "\e[0m") \
		LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
		LESS_TERMCAP_ue=$(printf "\e[0m") \
		LESS_TERMCAP_us=$(printf "\e[1;32m") \
		man "$@"
}

# Use feh to nicely view images
function openimage() {
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
function tre() {
	tree -aC -I '.git|node_modules|bower_components' --dirsfirst "$@" | less -FRNX;
}

#Check Terminal Emulator
function container() {
    pid=$$
    while true; do
        pid=$(ps -h -o ppid -p $pid 2>/dev/null)
        case $(ps -h -o comm -p $pid 2>/dev/null) in
        (gnome-terminal) echo "Running in gnome terminal";return;;
        (xterm) echo "Running in xterm";return;;
        (rxvt) echo "Running in rxvt";return;;
        (python) if [ ! -z "$(ps -h -o args -p $pid 2>/dev/null | grep guake)" ]; then echo "Running in Guake"; return; fi ;;
        esac
        [[ $(echo $pid) == 1 ]] && break
    done
}



