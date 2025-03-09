#install raspberry pi OS Lite on micro SD using raspberry pi imager 
#connect raspberry pi to wired LAN & display
#turn on raspberry pi
#username = pi
#password = raspberry

sudo apt -y update
sudo apt -y upgrade
#sudo apt -y install raspberrypi-ui-mods

packages=(
    aerc
    blueman
    fcitx5-mozc
    firefox
    i3
    ranger
    vim
    xfce4-terminal
    xinit
    xserver-xorg
)

for i in "${packages[@]}"; do
        sudo apt install "$i" -y;
done;

DEFAULT_USER=mxvish
echo 'exec i3' > /home/$DEFAULT_USER/.xinitrc
curl https://raw.githubusercontent.com/mxvish/vimrc/main/vimrc > /home/$DEFAULT_USER/.vimrc

curl https://raw.githubusercontent.com/mxvish/i3config/main/config > ~/.config/i3/config
wget https://raw.githubusercontent.com/mxvish/i3status/main/i3status.conf
sudo mv i3status.conf /etc/

sudo timedatectl set-timezone Asia/Tokyo

#after GUI was installed
sudo apt -y install mpg123
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

#enable speaker, i2c, vnc server, ssh, us keyboard layout & auto login
sudo raspi-config
:'
1 System options -> audio -> headphones
1 System Options -> S5 Boot / Auto Login -> B4 Desktop Autologin
3 interface options -> i2c -> yes
3 interface options -> vnc -> yes
(if necessary)
  3 interface options -> ssh -> yes
  5 localisation options -> keyboard -> yes -> yes ... no(x server)
'

#optional
sudo apt -y install vim
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
mv vimrc .vimrc
#sudo apt -y install agnostics
sudo apt -y install nodejs
#curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

reboot
