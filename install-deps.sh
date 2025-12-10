#!/bin/sh

set -euo pipefail

UNAME=$(uname -s)
if [ $UNAME = "Darwin" ]; then
    echo "Detected OSX ($UNAME) environment"
    UPDATE_CMD="brew update"
    INSTALL_CMD="brew install"
elif [ $UNAME = "Debian" ]; then # TODO: Check this value
    echo "Detected Debian ($UNAME) environment"
    UPDATE_CMD="sudo apt-get update"
    INSTALL_CMD="sudo apt-get install"
else
    echo "Running in unknown environment ($UNAME), exiting"
    exit 1
fi

echo "Installing packages"
$UPDATE_CMD

$INSTALL_CMD \
    zsh \
    neovim \
    tmux \
    git

echo "Seeing if zsh needs to be set as default terminal"
SHELL_SET=0
if [ $SHELL = "$(which zsh)" ]; then
    "already running in zsh, no need to set default shell"
else
    echo "Changing zsh to be default shell"
    if [ $UNAME = "Darwin" ]; then
        # chsh needs to be run with sudo on OSX to set to a "non-standard shell"
        sudo chsh -s $(which zsh) "$USER"
    else
        chsh -s $(which zsh)
    fi
    SHELL_SET=1
fi

echo "Done"
if [ $SHELL_SET -eq 1 ]; then
    echo "zsh was set as current shell, so you should log out and log back in before doing anything else"
fi
echo "Done. You should probably run post-install-deps.debian.sh now"
