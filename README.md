This is my default install script on linux. I made 2 Versions, 1 for Arch-based Systems and 1 for Debian-based Systems. <br />
A Version for Sound Systems will follow;) <br />
<br />
To get and run the script type the following in a terminal <br />
<br />
Arch based
```
wget https://lab2k3.ddns.net/ljurk/initLinuxInstallation/raw/branch/master/installOnArch.sh
chmod u+x installOnArch.sh
sudo ./installOnArch.sh
#PU_NOCONFIRM=1 and 0 in both /etc/yaourtrc and ~/.yaourtrc to not always ask
sudo nano /etc/inputrc
uncomment:
#set bell-style none
```
Debian based
```
wget https://lab2k3.ddns.net/ljurk/initLinuxInstallation/raw/branch/master/install.sh
chmod u+x install.sh
sudo ./install.sh
```