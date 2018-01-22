# Run shared aliases
source ~/dotfiles/shared/.bash_aliases

# caen hates tmux config files for some reason, so tmux needs to be
# started with the -f flag
alias tmux="tmux -f ~/dotfiles/caen/.tmux.conf"
