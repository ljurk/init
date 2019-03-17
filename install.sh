#!/bin/bash

#set IFS to read the csv
OLDIFS=$IFS
IFS=","

if [ "$#" == "1" ]
then
    if [ "$1" == "test" ]
    then
        #exit at first error
        set -e
    fi
fi

echo "###############PACMAN-PACKAGES###############"
#update
echo "update pacman packages"
sudo pacman -Syu --noconfirm > /dev/null

#install pacman packages
sed 1d ./prg.csv | while read -r NAME DESCRIPTION
do
    echo "installing $NAME : $DESCRIPTION"
    sudo pacman --noconfirm -S "$NAME" > /dev/null
done 

#change default shell
export SHELL=/bin/zsh

#install antigen - zsh package manager
mkdir "$HOME/.antigen"
curl -L git.io/antigen > "$HOME/.antigen/antigen.zsh"

echo "###############PIP-PACKAGES###############"
#upgrade pip
pip install --upgrade pip --user
pip2 install --upgrade pip --user

#install pip packages
sed 1d ./pip.csv | while read -r NAME DESCRIPTION PIP_VERSION
do
    if [ "$PIP_VERSION" == "3.7" ]
    then
        echo "pip installing $NAME : $DESCRIPTION"
        pip3 install "$NAME" --user > /dev/null
    else
        echo "pip2.7 installing $NAME : $DESCRIPTION"
        pip2 install "$NAME" --user > /dev/null
    fi
done 

# reset IFS
IFS=$OLDIFS

#install fonts
rm -rf /tmp/fonts
git clone https://github.com/powerline/fonts.git --depth=1 /tmp/fonts
#sed -i 's#$HOME/.local/share/fonts#$HOME/.fonts#g' /tmp/fonts/install.sh
/tmp/fonts/install.sh

#platformio need udev rules for uploading. see: https://docs.platformio.org/en/latest/faq.html#platformio-udev-rules
curl -fsSL https://raw.githubusercontent.com/platformio/platformio-core/develop/scripts/99-platformio-udev.rule    s | sudo tee /etc/udev/rules.d/99-platformio-udev.rules

#install my dotfiles
git clone https://github.com/ljurk/dotfiles.git "$HOME/dotfiles"
rm -rf "$HOME/.bashrc"
rm -rf "$HOME/.bash_profile"
rm -rf "$HOME/.i3/config"
rm -rf "$HOME/.config/ranger"
rm -rf "$HOME/.Xressources"
(cd "$HOME/dotfiles" ; stow *)

#setup virtualbox
#sudo modprobe vboxdrv
#sudo modprobe vboxnetflt

echo "###############DONE###############"
