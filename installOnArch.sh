if [ $1 == "atom" ]
then
  	#run as user
    echo "installing atom packages"
	#install atom packages
    apm install platformio-ide
    apm install git-plus
    apm install package-switch
fi
if [ $1 == "i3" ]
then
    pacman -Syu

    pacman -S --noconfirm i3blocks
    pacman -S --noconfirm git
    git config --global user.name "ljurk"
    git config --global user.email "ljurk@pm.me"

    sudo pacman -S remmina freerdp 
    pacman -S --noconfirm firefox
    pacman -S --noconfirm python-pip
    pacman -S urxvt-perls

    #pip
    pip install powerline-status
    pip install passhole
    pip2.7 install platformio
#need udev rules for uploading. see: https://docs.platformio.org/en/latest/faq.html#platformio-udev-rules
    curl -fsSL https://raw.githubusercontent.com/platformio/platformio-core/develop/scripts/99-platformio-udev.rules | sudo tee /etc/udev/rules.d/99-platformio-udev.rules

    #firewall
    pacman -S --noconfirm gufw

    rm -rf /tmp/fonts
    git clone https://github.com/powerline/fonts.git --depth=1 /tmp/fonts
    sed -i 's#$HOME/.local/share/fonts#/home/ljurk/.fonts#g' /tmp/fonts/install.sh
    /tmp/fonts/install.sh
fi
