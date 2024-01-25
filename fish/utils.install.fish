#!/usr/bin/fish

curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs https://git.io/fisher

fisher install fishpkg/fish-prompt-metro
fisher install edc/bass
fisher install FabioAntunes/fish-nvm

nvm install 20

