#initial update+upgrade
apt-get update
apt-get upgrade -y
#start installing
#development
apt-get install git -y
git config --global user.name "ljurk"
git config --global user.email "ljurk@protonmail.com"
#install atom
wget https://github.com/atom/atom/releases/download/v1.28.2/atom-amd64.deb
sudo dpkg -i atom-amd64.deb
#clang for platformio
apt-get install clang -y
#install atom packages
apm install platformio-ide
apm install git-plus
#audio
apt-get install banshee -y
apt-get install audacity -y

apt-get install keepassx -y

#create .ssh folder
mkdir ~/.ssh
chown ljurk:ljurk ~/.ssh
