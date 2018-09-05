Dotfiles
========

After cloning this repo, run `install` to automatically set up the development
environment. Note that the install script is idempotent: it can safely be run
multiple times.

Dotfiles uses [Dotbot][dotbot] for installation.

Making Local Customizations
---------------------------

You can make local customizations for some programs by editing these files:

* `vim` : `~/.vimrc_local`
* `zsh` : `~/.zshrc_local_before` run before `.zshrc`
* `zsh` : `~/.zshrc_local_after` run after `.zshrc`
* `git` : `~/.gitconfig_local`
* `hg` : `~/.hgrc_local`
* `tmux` : `~/.tmux_local.conf`


Synchronizing Intellij Setting
https://blog.jetbrains.com/idea/2017/09/intellij-idea-2017-3-eap-better-synchronization-of-your-settings-across-devices-and-other-improvements/

-use IDE Settings Sync


One Click Install
---------------------------

cd ~ && git clone https://github.com/francissabado/dotfiles && cd dotfiles && ./install



Dotbot Useful Commands
---------------------------

Adding Submodules

git submodule add <github-submodule-path> <directory-name>


Updating Submodules and checking out specified versions

git submodule update --init --recursive


Update all submodules to latest

git submodule foreach --recursive git pull origin master


Update a specific submodule to latest

# change to the submodule directory
cd <submodule-directory>

# checkout desired branch
git checkout master

# update
git pull

# get back to your project root
cd ..

# now the submodules are in the state you want, so
git commit -am "Pulled down update to submodule_dir"


#One line to do all that
git submodule git pull origin master


Editing Setting

gedit $HOME/dotfiles/.install.conf.yaml

Force Update the Installation
---------------------------
touch install.conf.yaml


Possible Fix for Multi-system Dotfiles
---------------------------
https://github.com/anishathalye/dotbot/pull/11#issuecomment-73082152


[Based on https://github.com/anishathalye/dotfiles]


