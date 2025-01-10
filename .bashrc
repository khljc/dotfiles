#!/usr/bin/env bash
# ${HOME}/.bashrc: executed by bash(1) for non-login shells.
# If not running interactively, don't do anything

# prompt
PS1="\${PWD} ➜ " 

# aliases
alias e='ls -lh'
alias ea='ls -lah'
alias n='nvim'

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

