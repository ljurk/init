#!/bin/bash

OLDIFS=$IFS
IFS=";"

#update
sudo pacman -Syu --noconfirm > /dev/null

#install pip2.7
wget https://bootstrap.pypa.io/get-pip.py
sudo python2.7 get-pip.py

#install pacman packages
sed 1d ./prg.csv | while read NAME DESCRIPTION
do
    #sudo pacman --noconfirm -S $NAME > /dev/null
    echo "installing $NAME : $DESCRIPTION"
done 

#install pip packages
sed 1d ./pip.csv | while read NAME DESCRIPTION PIP_VERSION
do
    if [ $PIP_VERSION == "3.7" ]
    then
        pip install $NAME --user > /dev/null
        echo "pip installing $NAME : $DESCRIPTION"
    else
        pip2.7 install $NAME --user > /dev/null
        echo "pip2.7 installing $NAME : $DESCRIPTION"
    fi
done 

IFS=$OLDIFS
