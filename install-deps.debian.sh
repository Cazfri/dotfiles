#!/bin/sh

set -euo pipefail

echo "Installing packages"
sudo apt-get update

sudo apt-get install \
    zsh \
    neovim \
    tmux \
    curl \
    git

echo "Seeing if zsh needs to be set as default terminal"
SHELL_SET=0
if [ $SHELL = "$(which zsh)" ]; then
    "already running in zsh, no need to set default shell"
else
    echo "Changing zsh to be default shell"
    chsh -s $(which zsh)
    SHELL_SET=1
fi

echo "Done"
if [ $SHELL_SET -eq 1 ]; then
    echo "zsh was set as current shell, so you should log out and log back in before doing anything else"
fi
echo "Done. You should probably run post-install-deps.debian.sh now"
