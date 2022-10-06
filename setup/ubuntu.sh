#!/bin/bash -i

# Install apps

flatpak install \
	org.gimp.GIMP \
	app/com.bitwarden.desktop/x86_64/stable \
	com.discordapp.Discord \
	app/com.valvesoftware.Steam/x86_64/stable \
	-y

sudo apt-add-repository ppa:fish-shell/release-3

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
	neovim \
	exa \
	starship \
	tldr \
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

ghq get -p git@github.com/michalsapka/dotfiles.git

cd "$HOME/ghq/github.com/michalsapka/dotfiles"
stow nvim --dir="$HOME/ghq/github.com/michalsapka/dotfiles" --target="$HOME"
stow tmux --dir="$HOME/ghq/github.com/michalsapka/dotfiles" --target="$HOME"
stow fish --dir="$HOME/ghq/github.com/michalsapka/dotfiles" --target="$HOME"
stow zsh --dir="$HOME/ghq/github.com/michalsapka/dotfiles" --target="$HOME"
stow bin --dir="$HOME/ghq/github.com/michalsapka/dotfiles" --target="$HOME"
stow alacritty --dir="$HOME/ghq/github.com/michalsapka/dotfiles" --target="$HOME"

# Use Fish shell

chsh -s /usr/bin/fish

# Install nerd font

cd ~/Downloads
mkdir ~/.local/share/fonts
git clone git@github.com:ryanoasis/nerd-fonts.git
cd nerd-fonts
./install.sh FiraCode
./install.sh SourceCodePro





echo "Setup done!"





#other:
#- gh-cli - https://garywoodfine.com/how-to-install-github-cli-on-linux/
