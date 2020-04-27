#!/usr/bin/fish

curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs https://git.io/fisher

fisher add fishpkg/fish-prompt-metro
fisher add edc/bass:master
fisher add FabioAntunes/fish-nvm

nvm install 12

