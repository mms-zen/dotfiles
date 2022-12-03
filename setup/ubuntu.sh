#!/bin/bash -i

# Install apps

flatpak install \
	org.gimp.GIMP \
	app/com.bitwarden.desktop/x86_64/stable \
	com.discordapp.Discord \
	app/com.valvesoftware.Steam/x86_64/stable \
	-y

type -p curl >/dev/null || sudo apt install curl -y
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg \
&& sudo chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg \
&& echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null \

sudo apt-add-repository ppa:fish-shell/release-3 -y
sudo add-apt-repository ppa:neovim-ppa/stable -y

sudo apt update && sudo apt upgrade
sudo apt install \
	git \
	curl \
	alacritty \
	tmux \
	fish \
	exa \
	stow \
	ripgrep \
	fzf \
	stow \
	exa \
	xmodmap \
	tldr \
  neovim \
  gh \
	-y

curl -sS https://starship.rs/install.sh | sh

# Configure Git

mkdir ~/.ssh

if [[ ! -f ~/.ssh/id_rsa ]] ; then
    echo 'id_rsa does not exist in system. EXITING'
    exit
fi

if [[ ! -f ~/.ssh/id_rsa.pub ]] ; then
    echo 'id_rsa.pub does not exist in system. EXITING'
    exit
fi

eval "$(ssh-agent -s)"
chmod 600 "$HOME/.ssh/id_rsa"
ssh-add "$HOME/.ssh/id_rsa"

# Install and setup asdf

rm -rf ~/.asdf
git clone git@github.com:asdf-vm/asdf.git ~/.asdf 
. $HOME/.asdf/asdf.sh # temporary source, as later we will use Fish
#echo ". $HOME/.asdf/asdf.sh" >> ~/.bashrc
source $HOME/.asdf/asdf.sh

asdf plugin add ruby
asdf plugin add nodejs
asdf plugin add rust
asdf plugin add golang

# things that are not in apt :(
asdf plugin add ghq

asdf install

# Install dotfiles

rm ~/.tool-versions

ghq get -p git@github.com/michalsapka/dotfiles.git

cd "$HOME/ghq/github.com/michalsapka/dotfiles"
stow nvim --dir="$HOME/ghq/github.com/michalsapka/dotfiles" --target="$HOME"
stow tmux --dir="$HOME/ghq/github.com/michalsapka/dotfiles" --target="$HOME"
stow fish --dir="$HOME/ghq/github.com/michalsapka/dotfiles" --target="$HOME"
stow zsh --dir="$HOME/ghq/github.com/michalsapka/dotfiles" --target="$HOME"
stow bin --dir="$HOME/ghq/github.com/michalsapka/dotfiles" --target="$HOME"
stow alacritty --dir="$HOME/ghq/github.com/michalsapka/dotfiles" --target="$HOME"
stow asdf --dir="$HOME/ghq/github.com/michalsapka/dotfiles" --target="$HOME"
stow newsboat --dir="$HOME/ghq/github.com/michalsapka/dotfiles" --target="$HOME"

# Use Fish shell

chsh -s /usr/bin/fish

# Install Tmux plugins

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
~/.tmux/plugins/tpm/bin/install_plugins

# Install all asdf packages

asdf install

echo "Setup done!"
