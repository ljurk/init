#adding repo
add-apt-repository ppa:webupd8team/atom -y
#initial update+upgrade
apt-get update
apt-get upgrade -y
#start installing
#development
apt-get install git -y
git config --global user.name "ljurk"
git config --global user.email "ljurk@protonmail.com"
#install atom
curl -sL https://packagecloud.io/AtomEditor/atom/gpgkey | sudo apt-key add -
sudo sh -c 'echo "deb [arch=amd64] https://packagecloud.io/AtomEditor/atom/any/ any main" > /etc/apt/sources.list.d/atom.list'
apt-get update
apt-get install atom -y

apm install platformio-ide
apm install git-plus
#audio
apt-get install banshee -y 
apt-get install audacity -y 

apt-get install keepassx -y 

mkdir ~/.ssh
