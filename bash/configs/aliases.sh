#!/bin/bash

#Easy reload of bashrc
#https://stackoverflow.com/questions/2518127/how-do-i-reload-bashrc-without-logging-out-and-back-in
alias reload-bash="source ~/.bash_profile"
alias reload="source ~/.bash_profile"
#alias reload-bash-clean="exec ${BASH}"

# Temporarily disable bash alias
## call alias with a backslash ##
#\c
#unalias aliasname

#Editing
alias edit-bashrc="${EDITOR} ~/.bashrc"
alias edit-aliases="${EDITOR} ~/dotfiles/bash/configs/aliases.cfg"
alias edit-env="${EDITOR} ~/dotfiles/bash/configs/env.cfg"
alias edit-functions="${EDITOR} ~/dotfiles/bash/configs/functions.cfg"
alias edit-bash-options="${EDITOR} ~/dotfiles/bash/configs/functions.cfg"

#Files/Folders
alias mkdir='mkdir -p -v'
alias mv='mv -iv'
alias rm='rm -Iv --one-file-system --preserve-root' #prevent any issues with removal

#Search text
alias search-text='grep -rnw . -e ' #include the pattern
## Colorize the grep command output for ease of use (good for log files)##
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

#Start calculator with math support
alias bc='bc -l'

#Interative link
alias ln='ln -i'

#platform='unknown'
#unamestr=`uname`
#if [[ "$unamestr" == 'Linux' ]]; then
#    platform='linux'
#    # some more ls aliases
alias ll='ls -alh --color=auto'
alias la='ls -A --color=auto'
alias l='ls -CFlh --color=auto'
alias woo='fortune --color=auto'
alias lsd="ls -alF | grep /$"
alias lo="ls -o --color=auto"
alias lh="ls -lh --color=auto"
alias sl="ls --color=auto"
alias s="ls --color=auto"
alias ls="ls --color=auto"
#elif [[ "$unamestr" == 'Darwin' ]]; then
#    platform='Mac'
#    # some more ls aliases
#    export CLICOLOR=1
#    alias ll='ls -alh -G'
#    alias la='ls -A -G'
#    alias l='ls -CFlh -G'
#    alias woo='fortune -G'
#    alias lsd="ls -alF | grep /$"
#    alias lo="ls -o -G"
#    alias lh="ls -lh -G"
#    alias sl="ls -G"
#    alias s="ls -G"
#    alias ls="ls -G"
#fi

# Directory navigation aliases
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ~="cd ~" #`cd` is probably faster
alias -- -="cd -"

#colorize diff
alias diff='colordiff'

#Make mount command output pretty and human readable format
alias mount='mount | column -t'

#Jobs
alias j='jobs -l'

#Useful times
alias path='echo -e ${PATH//:/\\n}'
alias ld_library='echo -e ${LD_LIBRARY_PATH//:/\\n}'
alias now='date +"%T"'
alias nowtime=now
alias nowdate='date +"%d-%m-%Y"'


#Temp for Python shortcut
alias py="python2.7"

# This is GOLD for finding out what is taking so much space on your drives!
alias diskspace="du -S | sort -n -r |more"

# Command line mplayer movie watching for the win.
alias mp="mplayer -fs"

# Show me the size (sorted) of only the folders in this directory
alias folders="find . -maxdepth 1 -type d -print | xargs du -sk | sort -rn"

#find current directory
alias find-pwd='find . -iname'
alias find-pwd-file='find . -type f -iname'


# This will keep you sane when you're about to smash the keyboard again.
alias frak="fortune"

# copy working directory
alias cpwd='pwd | tr -d "\r\n" | xclip -selection clipboard'

# Shortcuts
alias dl="cd ~/Downloads"
alias g="git"
alias h="history"
alias gc=". /usr/local/bin/gitdate && git commit -v "
alias j="jobs"
alias cls='clear'
alias c='clear'

# Enable aliases to be sudo’ed
alias sudo='sudo '

# IP addresses
alias pubip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="sudo ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1'"
alias ips="sudo ifconfig -a | grep -o 'inet6\? \(addr:\)\?\s\?\(\(\([0-9]\+\.\)\{3\}[0-9]\+\)\|[a-fA-F0-9:]\+\)' | awk '{ sub(/inet6? (addr:)? ?/, \"\"); print }'"

# copy file interactive
alias cp='cp -i'

# move file interactive
alias mv='mv -i'

#Show open ports
alias ports='netstat -tulanp'

#https://opensource.com/article/18/9/handy-bash-aliases
#How many times have you needed to unpack a .tar file and couldn't remember the exact arguments needed? Aliases to the rescue! Just add the following to your .bash_profile file and then use untar FileName to unpack any .tar file.
alias untar='tar -zxvf '
#Want to download something but be able to resume if something goes wrong?
alias wget='wget -c '
#Need to generate a random, 20-character password for a new online account? No problem.
alias getpass="openssl rand -base64 20"
#Downloaded a file and need to test the checksum? We've got that covered too.
alias sha='shasum -a 256 '
#Generate sha1 digest
alias sha1='openssl sha1'
#A normal ping will go on forever. We don't want that. Instead, let's limit that to just five pings.
alias ping='ping -c 5'
# Do not wait interval 1 second, go fast #
alias fastping='ping -c 100 -s.2'
#Start a web server in any folder you'd like.
alias www='python -m SimpleHTTPServer 8000'
#Want to know how fast your network is? Just download Speedtest-cli and use this alias. You can choose a server closer to your location by using the speedtest-cli --list command.
alias speed='speedtest-cli --server 2406 --simple'
#How many times have you needed to know your external IP address and had no idea how to get that info? Yeah, me too.
alias ipe='curl ipinfo.io/ip'
#Need to know your local IP address?
alias ipi='ipconfig getifaddr en0'
#Finally, let's clear the screen.
alias c='clear'



## set some other defaults ##
alias df='df -H'
alias du='du -ch'
# top is atop, just like vi is vim
#alias top='atop'

#https://stackoverflow.com/questions/18215973/how-to-check-if-running-as-root-in-a-bash-script
alias isroot='id -u'

#Root aliases
# if user is not root, pass all commands via sudo #
if [ $UID -ne 0 ]; then
    # become root #
    alias root='sudo -i'
    alias su='sudo -i'

    alias reboot='sudo reboot'
    alias apt-get='sudo apt-get'
    alias yum='sudo yum'
    alias yumy='sudo yum -y'
    alias visudo='sudo visudo'


    # reboot / halt / poweroff
    alias reboot='sudo /sbin/reboot'
    alias poweroff='sudo /sbin/poweroff'
    alias halt='sudo /sbin/halt'
    alias shutdown='sudo /sbin/shutdown'
    alias shutdown-now='sudo /sbin/shutdown now'
fi

#System Information
alias memory='free -m -l -t -h'
# get top process eating memory
alias psmem='ps auxf | sort -nr -k 4'
alias psmem10='ps auxf | sort -nr -k 4 | head -10' ## get top process eating cpu ##
# Get server cpu info
alias cpuinfo='lscpu'
# older system use /proc/cpuinfo
alias cpuinfo1='less /proc/cpuinfo'
# get GPU ram on desktop / laptop
alias gpumeminfo='grep -i --color memory /var/log/Xorg.0.log'
#disk information
alias diskinfo='lsblk'

#https://www.howtogeek.com/412055/37-important-linux-commands-you-should-know/