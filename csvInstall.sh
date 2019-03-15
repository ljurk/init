#!/bin/bash

OLDIFS=$IFS
IFS=","

#exit at first error
if [ $1 == "test" ]
then
    set -e
fi

#update
sudo pacman -Syu --noconfirm > /dev/null

echo "###############PACMAN-PACKAGES###############"
#install pacman packages
sed 1d ./prg.csv | while read NAME DESCRIPTION
do
    echo "installing $NAME : $DESCRIPTION"
    sudo pacman --noconfirm -S $NAME > /dev/null
done 

#change default shell
export SHELL=/bin/zsh

echo "###############PIP-PACKAGES###############"
#upgrade pip
pip install --upgrade pip --user
pip2 install --upgrade pip --user

#install pip packages
sed 1d ./pip.csv | while read NAME DESCRIPTION PIP_VERSION
do
    if [ $PIP_VERSION == "3.7" ]
    then
        echo "pip installing $NAME : $DESCRIPTION"
        pip3 install $NAME --user > /dev/null
    else
        echo "pip2.7 installing $NAME : $DESCRIPTION"
        pip2 install $NAME --user > /dev/null
    fi
done 

#need udev rules for uploading. see: https://docs.platformio.org/en/latest/faq.html#platformio-udev-rules
curl -fsSL https://raw.githubusercontent.com/platformio/platformio-core/develop/scripts/99-platformio-udev.rule    s | sudo tee /etc/udev/rules.d/99-platformio-udev.rules
IFS=$OLDIFS


#oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

echo "###############DONE###############"
