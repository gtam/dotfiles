#!/bin/bash

DOT_FILES_DIR=~./dotfiles

[ -e ${DOT_FILES_DIR} ] && {
    echo "${DOT_FILES_DIR} already exists.  Existing."
    exit 1
}

/usr/bin/git clone https://github.com/gtam/dotfiles.git ${DOT_FILES_DIR} || {
    echo 'Git clone failed.  Exiting.'
    exit 1
}

cd ${DOT_FILES_DIR}

make install
