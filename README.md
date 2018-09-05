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

git submodule add <github-submodule-path>


Editing Setting

gedit $HOME/dotfiles/.install.conf.yaml

Force Update the Installation
---------------------------
touch install.conf.yaml

License
-------

Copyright (c) 2013-2016 Anish Athalye. Released under the MIT License. See
[LICENSE.md][license] for details.

[dotbot]: https://github.com/anishathalye/dotbot
[license]: LICENSE.md
