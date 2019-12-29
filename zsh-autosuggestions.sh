#!/bin/bash
#set -x

if [ -d "$HOME/.oh-my-zsh" ]; then
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
    retval=$?
    if [ $retval = 0 ]; then
    sed -i "/plugins=/ s/^\(.*\)\()\)/\1 zsh-autosuggestions\2/" $HOME/.zshrc
    fi
else
    echo "oh-my-zsh not install."
    exit 1
fi
