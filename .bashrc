#!/usr/bin/env bash
# ${HOME}/.bashrc: executed by bash(1) for non-login shells.
# If not running interactively, don't do anything

# prompt
PS1="\${PWD} > " 

# aliases
alias ls='ls -lh'
alias n='nvim'
alias e='emacs'

# fff function to cd on exit
f() {
    fff "$@"
    cd "$(cat "${XDG_CACHE_HOME:=${HOME}/.cache}/fff/.fff_d")"
}

# setting defaults
export EDITOR=nvim
export VISUAL=nvim

# vi keybindings
set -o vi

# zoxide
eval "$(zoxide init bash)"

# pfetch
export PF_ASCII="openbsd"
export PF_INFO="ascii title os host kernel uptime pkgs memory"
export GTK_THEME="Adwaita:dark"
export PATH="~/.config/emacs/bin:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
