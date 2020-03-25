#!/bin/sh
sudo pacman -S fakeroot binutils git ansible

#install yay
git clone https://aur.archlinux.org/yay.git /tmp/yay && cd /tmp/yay && makepkg -si && cd -
#install ansible-aur
git clone https://aur.archlinux.org/ansible-aur-git.git /tmp/aag && cd /tmp/aag && makepkg -si && cd -

ansible-playbook playbook.yml -K
