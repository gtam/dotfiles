#!/bin/bash

DOT_FILES_DIR=~/.dotfiles
TMUX_FILES_DIR=~/.tmux.git

[ -e ${DOT_FILES_DIR} ] && {
    echo "${DOT_FILES_DIR} already exists.  Existing."
    exit 1
}

[ -e ${TMUX_FILES_DIR} ] && {
    echo "${TMUX_FILES_DIR} already exists.  Existing."
    exit 1
}
git clone https://github.com/gpakosz/.tmux.git ~/.
ln -s -f ~/.tmux/.tmux.conf ~/.

git clone https://github.com/gtam/dotfiles.git ${DOT_FILES_DIR} || {
    echo 'Git clone failed.  Exiting.'
    exit 1
}

cd ${DOT_FILES_DIR}

make install
