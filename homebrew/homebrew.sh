#!/usr/bin/env bash

unameOut="$(uname -s)"
case "${unameOut}" in
    Linux*)     machine="Linux";;
    Darwin*)    machine="Mac";;
    CYGWIN*)    machine="Cygwin";;
    MINGW*)     machine="MinGw";;
    *)          machine="UNKNOWN:${unameOut}"
esac
#echo ${machine}

export PATH=${PATH}:/home/linuxbrew/.linuxbrew/bin

alias cask='brew install --cask'

function f_brew_bootstrap (){
    brew bundle --file ~/dotfiles/homebrew/Brewfile-brew

    if [ "$machine" == "Mac" ]; then
        brew bundle --file ~/dotfiles/homebrew/Brewfile-cask
    fi
}
