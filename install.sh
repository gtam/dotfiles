#!/bin/bash
set -x

DOT_FILES_DIR=~/.dotfiles
TMUX_FILES_DIR=~/.tmux

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

[ -e ${DOT_FILES_DIR} ] && {
    echo "${DOT_FILES_DIR} already exists.  Delete ${DOT_FILES_DIR} and continue? "
    read -p '(Y/n): ' decision1
    if [[ "$decision1" == "Y" ]]; then
      rm -rf ${DOT_FILES_DIR}
    else
      exit 1
    fi
}

[ -e ${TMUX_FILES_DIR} ] && {
    echo "${TMUX_FILES_DIR} already exists.  Delete ${TMUX_FILES_DIR} and continue? "
    read -p '(Y/n): ' decision2
    if [[ "$decision2" == "Y" ]]; then
      rm -rf ${TMUX_FILES_DIR}
    else
      exit 1
    fi
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
