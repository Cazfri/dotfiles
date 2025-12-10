#!/bin/sh

set -euo pipefail

DOTFILES_DIR=$(dirname `realpath "$0"`)

$DOTFILES_DIR/install-deps.sh && $DOTFILES_DIR/copy-dotfiles.sh && $(which zsh) -c "$DOTFILES_DIR/post-install.sh"

