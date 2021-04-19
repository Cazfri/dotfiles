#!/bin/sh

CONFIG_DIR=$1

if [ -z "$CONFIG_DIR" ]; then
    echo "First argument must be a matching directory in dotfiles"
    exit 1
fi

CONFIG_DIR_FULL_PATH=$(dirname `realpath "$0"`)/$CONFIG_DIR

if [ ! -d $CONFIG_DIR_FULL_PATH ]; then
    echo "Directory $CONFIG_DIR does not exist in dotfile"
    exit 1
fi

for FILE_FULL_PATH in $CONFIG_DIR_FULL_PATH/*; do
    FILE="$(basename $FILE_FULL_PATH)"
    echo "Creating symlink for $FILE"

    if [ -f $HOME/.$FILE ]; then
        CONFIG_FILE=$HOME/.$FILE
        if [ -L $CONFIG_FILE ]; then
            echo "$CONFIG_FILE is a symlink pointing to $(readlink $CONFIG_FILE). Deleting it."
            rm $CONFIG_FILE
        else
	    echo "$CONFIG_FILE exists, creating backup"
	    mv $CONFIG_FILE $CONFIG_FILE.backup
        fi
    fi

    ln -s $FILE_FULL_PATH $HOME/.$FILE
done
