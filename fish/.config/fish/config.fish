set fish_greeting ""
set -gx TERM xterm-256color

# nvim for all
command -qv nvim && alias vim nvim && alias vi nvim

# exa
alias ll="exa -l --icons"
alias lla="exa -la --icons"

# git aliases as muscle memory die hard
alias ga "git add"
alias gaa "git add ."
alias gc "git commit"
alias gp "git push"
alias gst "git status"
alias gco "git checkout"


# theme
set -g theme_color_scheme terminal-dark
set -g fish_prompt_pwd_dir_length 1
set -g theme_display_user yes
set -g theme_hide_hostname no
set -g theme_hostname always

switch (uname)
  case Darwin
    source (dirname (status --current-filename))/config-osx.fish
  case Linux
    source (dirname (status --current-filename))/config-linux.fish
end
source (dirname (status --current-filename))/config-zendesk.fish

