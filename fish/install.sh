#!/bin/bash

sudo apt-add-repository ppa:fish-shell/release-2
sudo apt-get update
sudo apt install fish

set -e
SCRIPT=`realpath $0`
DIR=`dirname $SCRIPT`
BACKUP_DIR="$HOME/.dotfiles-backup"
FISH_CONFIG_DIR="$HOME/.config/fish"
FISH_LOCATION="$(which fish)"

link_prompt() {
    if [ -e $2 ]; then
        read -r -p "replace ‘$2’? y(es)|b(ackup)|no: "
        if [[ ${REPLY,,} =~ ^y(es)?$ ]]; then
            rm -rf $2
            ln -sf $1 $2
            REPLACED="$REPLACED\n$2"
        elif [[ ${REPLY,,} =~ ^b(ackup)?$ ]]; then
            mkdir -p "$BACKUP_DIR"
            mv $2 "$BACKUP_DIR"
            ln -sf $1 $2
            BACKUPED="$BACKUPED\n$2"
        else
            SKIPPED="$SKIPPED\n$2"
        fi
    else
        ln -sf $1 $2
        NEW="$NEW\n$2"
    fi
}

if [ ! -d "$FISH_CONFIG_DIR" ]; then
  echo "Create fish config dirs $FISH_CONFIG_DIR"
  mkdir -p $FISH_CONFIG_DIR
fi

link_prompt "$DIR/config.fish" "$FISH_CONFIG_DIR/config.fish"

chsh -s $(which fish)
