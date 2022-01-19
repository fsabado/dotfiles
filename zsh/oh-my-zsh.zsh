#!/bin/zsh

if [[ -f ~/.zshrc ]]; then
  rm ~/.zshrc ;
  ln -s ~/.dotfiles/zshrc ~/.zshrc
fi
