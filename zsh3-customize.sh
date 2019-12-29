#!/bin/sh

[ -e ${HOME}/.dotfiles/robbyrussell.zsh-theme ] && {
  echo "Symbolic linking robbyrussel.zsh-theme with customizations."
  ln -sfb ${HOME}/.dotfiles/robbyrussell.zsh-theme ${HOME}/.oh-my-zsh/themes/robbyrussell.zsh-theme
  }
source ${HOME}/.zshrc
