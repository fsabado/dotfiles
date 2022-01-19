#!/usr/bin/env bash

#Exist on error
set -e
set -x

CONFIG="install_conf.yaml"
#Modify this if it changes
#Assumes the the repository is cloned with name of 'dotfiles'
DOTBOT_DIR="${HOME}/dotfiles/.dotbot"

#Get absolute path
BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

cd "${BASEDIR}"

#Execute command
#[master] ~/dotfiles .dotbot/bin/dotbot --help
#usage: dotbot [-h] [-Q] [-q] [-v] [-d BASEDIR] [-c CONFIGFILE] [-p PLUGIN]
#              [--disable-built-in-plugins] [--plugin-dir PLUGIN_DIR]
#              [--version]
#
#optional arguments:
#  -h, --help            show this help message and exit
#  -Q, --super-quiet     suppress almost all output
#  -q, --quiet           suppress most output
#  -v, --verbose         enable verbose output
#  -d BASEDIR, --base-directory BASEDIR
#                        execute commands from within BASEDIR
#  -c CONFIGFILE, --config-file CONFIGFILE
#                        run commands given in CONFIGFILE
#  -p PLUGIN, --plugin PLUGIN
#                        load PLUGIN as a plugin
#  --disable-built-in-plugins
#                        disable built-in plugins
#  --plugin-dir PLUGIN_DIR
#                        load all plugins in PLUGIN_DIR
#  --version             show program's version number and exit

# Need to add sudo if command requires sudo
sudo "${DOTBOT_DIR}/bin/dotbot" -d "${BASEDIR}" -c "${BASEDIR}/${CONFIG}" "${@}"
