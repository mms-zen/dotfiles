export LANG=en_US.UTF-8

echo "My terminal. I like to keep it close to where my heart used to be"

alias vi="vim"
alias vim="nvim"

alias ll="exa -l -g --icons"
alias lla="ll -a"

alias gc="git commit"
alias ga="git add"
alias gaa="git add ."

alias nb="newsboat"
alias nm="neomutt"

export PATH=$PATH:~/.local/bin
. $(brew --prefix)/opt/asdf/libexec/asdf.sh
