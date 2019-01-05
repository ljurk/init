#!/bin/bash

OLDIFS=$IFS
IFS=";"

#install pacman packages
sed 1d ./prg.csv | while read NAME DESCRIPTION
do
#    sudo pacman --noconfirm -S $NAME > /dev/null
    echo "installing $NAME : $DESCRIPTION"
done 

#install pip packages
sed 1d ./pip.csv | while read NAME DESCRIPTION
do
    pip install $NAME --upgrade > /dev/null
    echo "pip installing $NAME : $DESCRIPTION"
done 




IFS=$OLDIFS
