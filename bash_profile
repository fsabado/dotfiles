# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

#Load local $HOME/.profile.d *.sh files
. ~/.profile.d/profile

# User specific environment and startup programs
export PATH=$PATH:$HOME/.local/bin:$HOME/bin


