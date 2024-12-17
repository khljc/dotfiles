if status is-interactive
    # Commands to run in interactive sessions can go here
end

# defaults
set -gx EDITOR "nvim"
set -gx VISUAL "nvim"

# source
zoxide init fish | source

# aliases
alias n="nvim"
alias e="ls -l"
alias r="ranger"
alias grep='grep --color=auto'

# startup commands
function fish_greeting

	# greetings
  set powered_msgs \
    "In all things shewing thyself a pattern of good works;" \
    "Live a quiet and rigtheous life, worthy of God." \
    "Lord, increase our faith." \
    "Whatsoever a man soweth, that sall he also reap."\
    "How shall we escape, if we neglect so great a salvation?"

	# picks a msg randomly
  set chosen_msg (random)"%"(count $powered_msgs)
  set chosen_msg $powered_msgs[(math $chosen_msg"+1")]

	# output
  printf "%s\n" $chosen_msg

  end

# PATH
export PATH="$PATH:/home/k/.cargo/bin"
export PATH="$PATH:/home/k/.config/emacs/bin"

# starship
#starship init fish | source

set -gx MANPAGER 'nvim -c "Man!" -c "set nonumber" -c "set norelativenumber" -c "set nofoldenable"'
