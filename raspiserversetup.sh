#install raspberry pi OS Lite on micro SD using raspberry pi imager 
#connect raspberry pi to wired LAN & display
#turn on raspberry pi
#username = pi
#password = raspberry

sudo apt -y update
sudo apt -y upgrade
sudo apt -y install raspberrypi-ui-mods

#after GUI was installed
sudo apt -y install mpg321
sudo apt -y install fcitx-mozc
sudo apt -y install python3-pip 
sudo apt -y install python3-tk 

#install i2cdetect
sudo apt -y install i2c-tools

#install gpio command
sudo apt -y install git
git clone https://github.com/wiringpi/wiringpi
cd wiringpi
./build

sudo apt -y install mu-editor 
pip3 install wiringpi
sudo apt -y install realvnc-vnc-server
sudo apt -y install network-manager
sudo apt -y install network-manager-gnome --fix-missing
sudo apt -y install xfce4-power-manager --fix-missing

#enable wifi
sudo apt -y purge openresolv dhcpcd5

#enable i2c, vnc server, ssh, us keyboard layout & auto login
sudo raspi-config
:'
3 interface options -> i2c -> yes
3 interface options -> vnc -> yes
3 interface options -> ssh -> yes
5 localisation options -> keyboard -> yes -> yes ... no(x server)
1 System Options -> S5 Boot / Auto Login -> B4 Desktop Autologin
'

#optional
sudo apt -y install vim
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
mv vimrc .vimrc
#sudo apt -y install agnostics
sudo apt -y install nodejs
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim


reboot
#some commands are aliased at ~/.bashrc
#set some settings at ~/.vimrc
