#!/bin/bash

DOT_FILES_DIR=~/.dotfiles
TMUX_FILES_DIR=~/.tmux

for i in git make
  do
    which $i
    retval=$?
    if [ $retval = 1 ]; then
      echo $i not found
    fi
  done

[ -e ${DOT_FILES_DIR} ] && {
    echo "${DOT_FILES_DIR} already exists.  Exiting."
    exit 1
}

[ -e ${TMUX_FILES_DIR} ] && {
    echo "${TMUX_FILES_DIR} already exists.  Exiting."
    exit 1
}

git clone https://github.com/gpakosz/.tmux.git ${TMUX_FILES_DIR} || {
    echo "Git clone failed. Exiting"
    exit 1
}
ln -s -f ~/.tmux/.tmux.conf ~/.

git clone https://github.com/gtam/dotfiles.git ${DOT_FILES_DIR} || {
    echo "Git clone failed.  Exiting."
    exit 1
}

cd ${DOT_FILES_DIR}

make install
