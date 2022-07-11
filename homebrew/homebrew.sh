#!/usr/bin/env bash

export PATH=${PATH}:/home/linuxbrew/.linuxbrew/bin


function f_brew_bootstrap_mac (){
    brew bundle --file=~/dotfiles/homebrew/Brewfile-mac
}

function f_brew_backup_mac (){
    brew bundle dump --file=~/dotfiles/homebrew/Brewfile-mac
}

function f_brew_bootstrap_linux (){
    brew bundle --file=~/dotfiles/homebrew/Brewfile-linux
}

function f_brew_backup_linux (){
    brew bundle dump --file=~/dotfiles/homebrew/Brewfile-linux
}