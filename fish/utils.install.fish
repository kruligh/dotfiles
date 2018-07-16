#!/usr/bin/fish

curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs https://git.io/fisher

fisher edc/bass:master

curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash

fisher nvm

fish

nvm install 8.11
nvm install 8.10

curl -L https://get.oh-my.fish | fish

