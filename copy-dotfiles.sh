#!/bin/sh

set -euo pipefail

DOTFILES_DIR=$(dirname `realpath "$0"`)

DOTFILE_NAMES="tmux.conf zshrc"

for DOTFILE_NAME in $DOTFILE_NAMES; do
    DOTFILE_SRC="$DOTFILES_DIR/$DOTFILE_NAME"
    DOTFILE_DEST="$HOME/.$DOTFILE_NAME"

    if [ -f $DOTFILE_DEST ]; then
        if [ -L $DOTFILE_DEST ]; then
            rm $DOTFILE_DEST
        else
            echo "$DOTFILE_DEST exists, creating backup"
            mv $DOTFILE_DEST $DOTFILE_DEST.backup
        fi
    fi

    # If there's a directory there already, just let ln fail

    echo "linking $DOTFILE_DEST -> $DOTFILE_SRC"
    ln -s $DOTFILE_SRC $DOTFILE_DEST
done

# Install relevant configs in ~/.config
mkdir -p $HOME/.config
CONFIGDIR_NAMES="nvim zellij alacritty"

for CONFIGDIR_NAME in $CONFIGDIR_NAMES; do
    CONFIGDIR_DEST="$HOME/.config/$CONFIGDIR_NAME"
    CONFIGDIR_SRC="$DOTFILES_DIR/$CONFIGDIR_NAME"

    if [ -d $CONFIGDIR_DEST ]; then
        if [ -L $CONFIGDIR_DEST ]; then
            rm $CONFIGDIR_DEST
        else
            echo "$CONFIGDIR_DEST exists, creating backup"
            mv $CONFIGDIR_DEST $CONFIGDIR_DEST.backup
        fi
    fi

    echo "linking $CONFIGDIR_DEST -> $CONFIGDIR_SRC"
    ln -s $CONFIGDIR_SRC $CONFIGDIR_DEST
done

