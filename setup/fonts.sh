#!/bin/bash -i

# Install nerd font

cd ~/Downloads
mkdir ~/.local/share/fonts
git clone git@github.com:ryanoasis/nerd-fonts.git
cd nerd-fonts
./install.sh FiraCode
./install.sh SourceCodePro

echo "Setup done!"
