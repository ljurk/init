if [ $1 == "atom" ]
then
  	#run as user
    echo "installing atom packages"
	#install atom packages
    apm install platformio-ide
    apm install git-plus
    apm install package-switch
fi
if [ $1 == "xfce" ]
then
    pacman -Syu

    pacman -S git
    git config --global user.name "ljurk"
    git config --global user.email "ljurk@protonmail.com"
    pacman -S atom
    pacman -S aurvote
    #clang for platformio
    pacman -S clang

    pacman -S keepassx2
    pacman -S audacity
    #ssh pub
    mkdir ~/.ssh
    chown ljurk:ljurk ~/.ssh
    #ssh-keygen -y -f ~/.ssh/id_rsa > ~/.ssh/id_rsa.pub

	#firewall
    pacman -S gufw

    #theming
    pacman -S xfce-theme-manager
    #theme: vertex-maia-dark
    #winddow borders Numix
    #controls: Adawaita-dark
    #Icons: Numix Circle
fi
if [ $1 == "i3" ]
then
    pacman -Syu

    pacman -S git
    git config --global user.name "ljurk"
    git config --global user.email "ljurk@protonmail.com"
    pacman -S atom
    pacman -S aurvote
    #clang for platformio
    pacman -S clang

    pacman -S keepassx2
    pacman -S audacity
    #ssh pub
    mkdir ~/.ssh
    chown ljurk:ljurk ~/.ssh
    #ssh-keygen -y -f ~/.ssh/id_rsa > ~/.ssh/id_rsa.pub
    
    #firewall
    pacman -S gufw

    wget https://lab2k3.ddns.net/ljurk/initLinuxInstallation/src/branch/master/i3config.txt
    #theming
fi
if [ $1 == "cinnamon" ]
    pacman -S git
    git config --global user.name "ljurk"
    git config --global user.email "ljurk@protonmail.com"
    pacman -S atom
    pacman -S aurvote
    #clang for platformio
    pacman -S clang

    pacman -S keepassx2
    pacman -S audacity
    #ssh pub
    mkdir ~/.ssh
    chown ljurk:ljurk ~/.ssh
    #ssh-keygen -y -f ~/.ssh/id_rsa > ~/.ssh/id_rsa.pub

    #firewall
    pacman -S gufw

fi
