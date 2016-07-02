#Modeline
# vim: set sw=4 ts=4 sts=4 et tw=78 foldmarker=<!,!> foldlevel=0 foldmethod=marker spell:

# <! Environment Settings

PS1="\[\033[35m\]\t\[\033[m\]-\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\e[37;1m\]jobs:\j\[\033[33;1m\]\w\[\033[m\]\$\n> "
#PS1="\n\[\e[32;1m\](\[\e[37;1m\]\u\[\e[32;1m\])-(\[\e[37;1m\]jobs:\j\[\e[32;1m\])-(\[\e[37;1m\]\w\[\e[32;1m\])\n(\[\[\e[37;1m\]! \!\[\e[32;1m\])-> \[\e[0m\]"

eval `dircolors ~/_env/colors/dircolors.ansi-dark`

#Remove the Beeping sound from Bash Shell
setterm -blength 0
