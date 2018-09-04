#Bash Options
#Source:https://www.digitalocean.com/community/tutorials/how-to-use-bash-history-commands-and-expansions-on-a-linux-vps
#saving 10000 lines to disk and loading the last 5000 lines into memory
HISTSIZE=5000
HISTFILESIZE=10000
# append instead of overwrite the history
shopt -s histappend
#enable commands in one terminal to be instantly be available in another
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

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


