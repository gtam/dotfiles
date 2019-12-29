#!/bin/bash
set -x

for i in zsh
do
    which zsh
    retval=$?
    if [ $retval = 0 ]; then
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    else
        echo "zsh not install."
        exit 1
    fi
done
