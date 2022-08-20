set fish_greeting ""

# nvim for all
command -qv nvim && alias vim nvim && alias vi nvim

# git aliases as muscle memory die hard
alias ga "git add"
alias gaa "git add ."
alias gc "git commit"
alias gp "git push"
alias gst "git status"

set -gx TERM xterm-256color

# theme
set -g theme_color_scheme terminal-dark
set -g fish_prompt_pwd_dir_length 1
set -g theme_display_user yes
set -g theme_hide_hostname no
set -g theme_hostname always

source /opt/asdf-vm/asdf.fish


