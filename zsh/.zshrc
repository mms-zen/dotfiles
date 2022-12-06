export LANG=en_US.UTF-8

autoload -U colors && colors	# Load colors
# Load version control information
autoload -Uz vcs_info
precmd() { vcs_info }

# Format the vcs_info_msg_0_ variable
zstyle ':vcs_info:git:*' formats '[%b]'

setopt PROMPT_SUBST
PROMPT='[$fg[red]% %n@%m %3~%{$reset_color%}]${vcs_info_msg_0_} %{$reset_color%}$%b '
echo "My terminal. I like to keep it close to where my heart used to be"


# Git
alias gc="git commit"
alias ga="git add"
alias gaa="git add ."
alias gst="git status"
alias gp="git push"
alias gco="git checkout"

alias ghs="gh pr checks --watch"
alias ghd="gh pr view --comments | grep -oe \"http.*spinnaker\S*\" | tail -1"

# open apps faster
alias nb="newsboat"
alias nm="neomutt"
alias vi="vim"
alias vim="nvim"
alias ll="exa -l -g --icons"
alias lla="ll -a"

# Zendesk stuff
alias grid="docker run -it --rm -v ~/.grid.yml:/root/.grid.yml -v /run/host-services/ssh-auth.sock:/run/host-services/ssh-auth.sock -e SSH_AUTH_SOCK="/run/host-services/ssh-auth.sock" -v ~/.ssh:/root/.ssh -v ~/.aws/credentials:/root/.aws/credentials -v ~/.goship.yaml:/root/.goship.yaml -v ~/.saml2aws:/root/.saml2aws -e TIMEZONE=Europe/Warsaw 724670621497.dkr.ecr.us-east-1.amazonaws.com/grid:stable grid \"\$@\""
source ~/ghq/github.com/zendesk/kubectl_config/dotfiles/kubectl_stuff.bash
alias zc="cd ~/ghq/github.com/zendesk/sell-core"

export PATH=$PATH:~/.local/bin
. $(brew --prefix)/opt/asdf/libexec/asdf.sh
