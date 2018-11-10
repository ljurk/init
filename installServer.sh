#initial update+upgrade
apt-get update
apt-get upgrade -y

#start installing
apt-get install git vim-gtk python3-pip  ca-certificates apt-transport-https 
#install php7.3
wget -q https://packages.sury.org/php/apt.gpg -O- |  apt-key add -
echo "deb https://packages.sury.org/php/ stretch main" | tee /etc/apt/sources.list.d/php.list
apt-get update
apt-get install php7.3

#configure  git
git config --global user.name "ljurk"
git config --global user.email "ljurk@protonmail.com"

sudo pip3 install git+git://github.com/powerline/powerline

git clone git@github.com:ljurk/dotfiles.git /home/ljurk/dotfiles

