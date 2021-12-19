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

#to install i2cdetect
sudo apt -y install i2c-tools

sudo apt -y install python3-tk 

#install gpio command
sudo apt -y install git
git clone https://github.com/wiringpi/wiringpi
cd wiringpi
./build
#gpio -v
#gpio readall

sudo apt -y install mu-editor 
sudo apt -y install tree 
pip3 install wiringpi

#enable sound
sudo raspi-config
#system options -> audio -> mai pcm i2s-hifi-0

#optional
sudo apt -y install neofetch
sudo apt -y install memtester
sudo apt -y install midori

#pip3 install jaconv
#installed python3 modules:
	#tkinter, wiringpi, random, time, subprocess, RPi.GPIO, unicodedata 

#not installed: pysimplegui, jaconv

#some commands are aliased at ~/.bashrc

#reference
#https://youtu.be/y45hsdAOpw
