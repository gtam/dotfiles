#!/bin/sh

[ -e ${HOME}/.dotfiles/robbyrussell.zsh-theme ] && {
  echo "Updating robbyrussel.zsh-theme with customizations."
  cp ~/.dotfiles/robbyrussell.zsh-theme .oh-my-zsh/themes/.
  }
source ${HOME}/.zshrc
