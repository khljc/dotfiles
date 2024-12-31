#!/usr/bin/env bash
# ${HOME}/.bashrc: executed by bash(1) for non-login shells.
# If not running interactively, don't do anything

# prompt
PS1="\${PWD} ➜ " 

# aliases
alias e='ls -lh --color=auto'
alias ea='ls -lah --color=auto'
alias n='nvim'

# fff function to cd on exit
f() {
    fff "$@"
    cd "$(cat "${XDG_CACHE_HOME:=${HOME}/.cache}/fff/.fff_d")"
}
