set fish_greeting "My terminal? I like to keep it where my heart used to be."
set -gx TERM xterm-256color

# nvim for all
command -qv nvim && alias vim nvim && alias vi nvim
set -gx EDITOR nvim

fish_vi_key_bindings

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
alias gs "gst"

# paths
set -gx PATH bin $PATH
set -gx PATH ~/bin $PATH
set -gx PATH ~/.local/bin $PATH


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

