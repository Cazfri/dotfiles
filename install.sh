#!/bin/sh

CONFIG_DIR=$1

if [ -z "$CONFIG_DIR" ]; then
    echo "First argument must be a matching directory in dotfiles"
fi

CONFIG_DIR_FULL_PATH=$PWD/$CONFIG_DIR

if [ ! -d $CONFIG_DIR_FULL_PATH ]; then
    echo "Directory $CONFIG_DIR does not exist in dotfile"
    exit 1
fi

for FILE_FULL_PATH in $CONFIG_DIR_FULL_PATH/*; do
    FILE="$(basename $FILE_FULL_PATH)"
    echo "Creating symlink for $FILE"

    if [ -f $HOME/.$FILE ]; then
        CONFIG_FILE=$HOME/.$FILE
	echo "$CONFIG_FILE exists, creating backup"
	mv $CONFIG_FILE $CONFIG_FILE.backup
    fi

    ln -s $FILE_FULL_PATH $HOME/.$FILE
done
