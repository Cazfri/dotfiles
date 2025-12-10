#!/bin/sh

set -euo pipefail

UNAME="$(uname -s)"
if [ $UNAME = "Darwin" ]; then
    echo "Detected OSX ($UNAME) environment"
    UPDATE_CMD="brew update"
    INSTALL_CMD="brew install"
elif [ $UNAME = "Linux" ]; then
    DISTRO="$(grep -e "^ID=" /etc/os-release | cut -d= -f2 | tr -d '"')"
    if [ $DISTRO = "rhel" ]; then
        echo "Detected RHEL ($UNAME - $DISTRO) environment"
        UPDATE_CMD="yum update -y"
        INSTALL_CMD="yum install -y"
    else # TODO: Figure out what Debian looks like
        echo "Detected Debian ($UNAME - $DISTRO) environment"
        UPDATE_CMD="apt-get update"
        INSTALL_CMD="apt-get install"
    fi
else
    echo "Running in unknown environment ($UNAME), exiting"
    exit 1
fi

SUDO_CMD=""
if [ ! -z "${SUDO_INSTALL-""}" ]; then
    echo "Running install commands as sudo"
    SUDO_CMD="sudo"
fi

echo "Installing packages"
$SUDO_CMD $UPDATE_CMD

$SUDO_CMD $INSTALL_CMD \
    zsh \
    neovim \
    tmux \
    git

echo "Seeing if zsh needs to be set as default terminal"
SHELL_SET=0
if [ $SHELL = "$(which zsh)" ]; then
    echo "already running in zsh, no need to set default shell"
else
    if [ $(which chsh > /dev/null; echo $?) -eq 0 ]; then
        echo "Changing zsh to be default shell"
        if [ $UNAME = "Darwin" ]; then
            # chsh needs to be run with sudo on OSX to set to a "non-standard shell"
            sudo chsh -s $(which zsh) "$USER"
        else
            chsh -s $(which zsh)
        fi
        SHELL_SET=1
    else
        echo "chsh does not exist, so not setting default shell!"
    fi
fi

if [ $SHELL_SET -eq 1 ]; then
    echo "zsh was set as current shell, so you should log out and log back in before doing anything else"
fi
echo "Finished install-deps"
