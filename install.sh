#!/bin/sh
sudo pacman -S fakeroot binutils git ansible

cd tmp
#install yay
git clone https://aur.archlinux.org/yay.git && cd yay
makepkg -si

#install ansible-aur
git clone https://aur.archlinux.org/ansible-aur-git.git && cd ansible-aur-git
makepkg -si

ansible-playbook playbook.yml -K
