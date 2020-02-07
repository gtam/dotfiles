#!/bin/bash
#set -x

DOT_FILES_DIR=~/.dotfiles
TMUX_FILES_DIR=~/.tmux

usage() {
    echo
    echo Usage:
    echo "curl https://raw.githubusercontent.com/gtam/dotfiles/master/install.sh | bash [-s help|reset]"
    echo "OR"
    echo "curl -L https://tinyurl.com/gtdotfiles | bash [-s help|reset]"
    echo
    echo "Optional parameters to show this help or to force delete the ~/.dotfiles and ~/.tmux folders."
}

if [ "$1" = "help" ]; then
    usage
    exit 0
fi

for i in git make
  do
    which $i
    retval=$?
    if [ $retval = 1 ]; then
      echo
      echo "Error: $i command not found, retry after install."
      echo
      exit 1
    fi
  done

if [ -d ${DOT_FILES_DIR} ] && [ "$1" = "reset" ]; then
    rm -rf ${DOT_FILES_DIR}
else
    if [ -d ${DOT_FILES_DIR} ]; then
        echo "${DOT_FILES_DIR} already exists.  Run with '| bash -s help' for help.  Exiting."
        exit 1
    fi
fi

if [ -d ${TMUX_FILES_DIR} ] && [ "$1" = "reset" ]; then
    rm -rf ${TMUX_FILES_DIR}
else
    if [ -d ${TMUX_FILES_DIR} ]; then
        echo "${TMUX_FILES_DIR} already exists.  Run with '| bash -s help' for help.  Exiting. "
        exit 1
    fi
fi

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
