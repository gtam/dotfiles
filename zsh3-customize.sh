#!/bin/sh

[ -e ${HOME}/.dotfiles/robbyrussell.zsh-theme ] && {
  echo "Updating robbyrussel.zsh-theme with customizations."
  cp ${HOME}/.oh-my-zsh/themes/robbyrussell.zsh-theme ${HOME}/.oh-my-zsh/themes/robbyrussell.zsh-theme
  }
source ${HOME}/.zshrc
