#Modeline
# vim: set sw=4 ts=4 sts=4 et tw=78 foldmarker=<!,!> foldlevel=0 foldmethod=marker spell:

# <! Environment Settings

#Helper source
include () {
    [[ -f "$1" ]] && source "$1"
}



#External plugins (initialized before)
include ~/.bashrc_local_before


PS1="\[\033[35m\]\t\[\033[m\]-\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\e[37;1m\]jobs:\j\[\033[33;1m\]\w\[\033[m\]\$\n> "
#PS1="\n\[\e[32;1m\](\[\e[37;1m\]\u\[\e[32;1m\])-(\[\e[37;1m\]jobs:\j\[\e[32;1m\])-(\[\e[37;1m\]\w\[\e[32;1m\])\n(\[\[\e[37;1m\]! \!\[\e[32;1m\])-> \[\e[0m\]"

#Remove the Beeping sound from Bash Shell
setterm -blength 0

export PATH=$HOME/.dotfiles/bin:$PATH

#Init Bash
include ~/.bash/init.bash

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
	xterm-color) color_prompt=yes;;
esac

# Append to the Bash history file, rather than overwriting it
shopt -s histappend

# Autocorrect typos in path names when using `cd`
shopt -s cdspell

# Add tab completion for SSH hostnames based on ~/.ssh/config
# ignoring wildcards
[[ -e "$HOME/.ssh/config" ]] && complete -o "default" \
	-o "nospace" \
	-W "$(grep "^Host" ~/.ssh/config | \
	grep -v "[?*]" | cut -d " " -f2 | \
	tr ' ' '\n')" scp sftp ssh


#External plugins (initialized after)
include ~/.bashrc_local_after
