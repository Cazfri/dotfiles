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

# Install neovim configs in ~/.config
mkdir -p $HOME/.config
NVIM_CONFIG_DEST=$HOME/.config/nvim
NVIM_CONFIGS_SRC=$DOTFILES_DIR/nvim

echo "linking $NVIM_CONFIG_DEST -> $NVIM_CONFIGS_SRC"
ln -s $NVIM_CONFIGS_SRC $NVIM_CONFIG_DEST

