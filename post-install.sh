#/bin/sh

set -euo pipefail

DOTFILES_DIR=$(dirname `realpath "$0"`)

echo "Installing oh-my-zsh"
if [ -d "$HOME/.oh-my-zsh" ]; then
    echo "oh-my-zsh is already installed, doing nothing"
else
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended --keep-zshrc
fi

echo "Adding custom oh-my-zsh theme"
ZSH_THEME=nmr.zsh-theme
ZSH_CUSTOM=$HOME/.oh-my-zsh/custom
rm -f $ZSH_CUSTOM/themes/$ZSH_THEME && ln -s $DOTFILES_DIR/$ZSH_THEME $ZSH_CUSTOM/themes/$ZSH_THEME

echo "Finished post-install"

