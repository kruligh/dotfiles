#!/bin/bash

if (( ${BASH_VERSION%%.*} < 4 )) ; then
    >&2 echo "Requires Bash version 4 or higher"
    exit 1
fi

set -e

SCRIPT=`realpath $0`
DIR=`dirname $SCRIPT`
BACKUP_DIR="$HOME/.dotfiles-backup"
NEW=
REPLACED=
SKIPPED=
export PATH="$PATH:$HOME/dotfiles/bin"

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

# git
link_prompt "$DIR/git/gitconfig" "$HOME/.gitconfig"

# vim
link_prompt "$DIR/vim/vimrc" "$HOME/.vimrc"
link_prompt "$DIR/vim/gvimrc" "$HOME/.gvimrc"
link_prompt "$DIR/vim/ideavimrc" "$HOME/.ideavimrc"
link_prompt "$DIR/vim" "$HOME/.vim"

# bash
link_prompt "$DIR/bash/bashrc" "$HOME/.bashrc"
link_prompt "$DIR/bash/bash_profile" "$HOME/.bash_profile"
link_prompt "$DIR/bash/inputrc" "$HOME/.inputrc"

# bash completions
link_prompt "$DIR/bash/bash_completion" "$HOME/.bash_completion"
link_prompt "$DIR/bash/completions" "$HOME/.bash_completion.d"

# gpg
link_prompt "$DIR/gnupg/gpg-agent.conf" "$HOME/.gnupg/gpg-agent.conf"
link_prompt "$DIR/gnupg/gpg.conf" "$HOME/.gnupg/gpg.conf"

if [ -n "$NEW" ]; then
    echo
    echo "New files:"
    echo -e $NEW
fi

if [ -n "$REPLACED" ]; then
    echo
    echo "Replaced files:"
    echo -e $REPLACED
fi

if [ -n "$BACKUPED" ]; then
    echo
    echo "Replaced with backup in $BACKUP_DIR:"
    echo -e $BACKUPED
fi

if [ -n "$SKIPPED" ]; then
    echo
    echo "Skipped files:"
    echo -e $SKIPPED
fi

echo

sudo apt install curl
sudo apt install xclip
sudo apt install vim

# fish
bash ./fish/install.sh
fish
./fish/utils.install.fish


# java sdk
read -r -p "Install java sdk 8? y(es)|no: "
if [[ ${REPLY,,} =~ ^y(es)?$ ]]; then
	sudo apt install openjdk-8-jdk
fi

# texpander
mkdir ~/.texpander
cp -r ./texpander/* ~/.texpander/
sudo apt install xsel
sudo apt install xdotool
sudo apt install zenity

touch ~/.xbindkeysrc
echo -e "\"xdotool key texpander.sh\"\n  Control+Shift + e" >> ~/.xbindkeysrc

