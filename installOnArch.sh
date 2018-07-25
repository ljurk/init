#install yaourt
pacman -S base-devel yaourt
#stop yaourt from asking for everything
touch ~/.yaourtrc
echo 'NOCONFIRM=1' > ~/.yaourtrc
echo 'BUILD_NOCONFIRM=1' > ~/.yaourtrc
echo 'EDITFILES=0' > ~/.yaourtrc