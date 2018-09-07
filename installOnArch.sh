if [ $1 == "atom" ]
  then
  	#run as user
    echo "installing atom packages"
	#install atom packages
    apm install platformio-ide
    apm install git-plus
    apm install package-switch    
  else
    #install yaourt
    pacman -S base-devel yaourt
    #stop yaourt from asking for everything
    touch ~/.yaourtrc
    chown ljurk:ljurk ~/.yaourtrc
    echo 'NOCONFIRM=1' >> ~/.yaourtrc
    echo 'BUILD_NOCONFIRM=1' >> ~/.yaourtrc
    echo 'EDITFILES=0' >> ~/.yaourtrc
    yaourt -Syu

    yaourt -S git
    git config --global user.name "ljurk"
    git config --global user.email "ljurk@protonmail.com"
    yaourt -S atom
    yaourt -S aurvote
    #clang for platformio
    yaourt -S clang

    yaourt -S keepassx2
    yaourt -S audacity
    #ssh pub
    mkdir ~/.ssh
    chown ljurk:ljurk ~/.ssh
    #ssh-keygen -y -f ~/.ssh/id_rsa > ~/.ssh/id_rsa.pub

    yaourt -S gufw
fi
