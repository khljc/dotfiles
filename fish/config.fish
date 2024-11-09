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
alias e="eza -l"
alias ea="eza -la"
alias r="ranger"

# startup commands
function fish_greeting

	# greetings
  set powered_msgs \
    "And that ye study to be quiet, and to do your own business, and to work with your own hands, as we commanded you;" \
    "In all things shewing thyself a pattern of good works; in doctrine shewing uncorruptness, gravity, sincerity," \
    "Live a quiet and rigtheous life, worthy of God." \
    "Lord, increase our faith." \
    "Whatsoever a man soweth, that sall he also reap."

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
starship init fish | source
