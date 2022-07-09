#!/usr/bin/env bash

function add_gitconfig_dotfiles (){
    # Make sure it exist
    touch -a ~/.gitconfig

    # Check if file already contains the string
    if grep -Fq "gitconfig_dotfiles" ~/.gitconfig
    then
        return 0
    fi

# Added the include dotfiles

cat <<-EOF >> ~/.gitconfig
[include]
    path = ~/.gitconfig_dotfiles

EOF
}

add_gitconfig_dotfiles
