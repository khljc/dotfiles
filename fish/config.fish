if status is-interactive
    # Commands to run in interactive sessions can go here
end

# defaults
set -gx EDITOR "nvim"
set -gx VISUAL "nvim"

# source
zoxide init fish | source

set -U fish_greeting 'Lord, increase our faith.'
alias n="nvim"
alias e="eza -l"
alias ea="eza -la"
alias r="ranger"

# startup commands
# PATH
export PATH="$PATH:/home/k/.cargo/bin"
export PATH="$PATH:/home/k/.config/emacs/bin"
