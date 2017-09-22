#!/bin/bash
OS_var=$(uname)
YUM_CMD=$(which yum)
APT_GET_CMD=$(which apt-get)
ZYPPER_CMD=$(which zypper)
PACMAN_CMD=$(which pacman)
FEDORA_CMD=$(which dnf)
function server_ascii ()
{
echo '  _________                                   ___ ___                .__   __  .__     
 /   _____/ ______________  __ ___________   /   |   \   ____ _____  |  |_/  |_|  |__  
 \_____  \_/ __ \_  __ \  \/ // __ \_  __ \ /    ~    \_/ __ \\__  \ |  |\   __\  |  \ 
 /        \  ___/|  | \/\   /\  ___/|  | \/ \    Y    /\  ___/ / __ \|  |_|  | |   Y  \
/_______  /\___  >__|    \_/  \___  >__|     \___|_  /  \___  >____  /____/__| |___|  /
        \/     \/                 \/               \/       \/     \/               \/ '
}
function distro_check ()
{
echo "nmap will now be installed with net-tools in order to run this script..press enter to continue."
read
cd ~
if [[ ! -z $YUM_CMD ]]; then
sudo yum install update
sudo yum install nmap
sudo yum install net-tools
sudo yum install mailx
elif [[ ! -z $APT_GET_CMD ]]; then
sudo apt-get update
sudo apt-get install nmap
sudo apt-get install net-tools
sudo apt-get install mailutils
elif [[ ! -z $ZYPPER_CMD ]]; then
sudo zypper up
sudo zypper install nmap
sudo zypper install net-tools
sudo zypper install mailx
elif [[ ! -z $PACMAN_CMD ]]; then
sudo pacman -Syu
sudo pacman -Sy nmap
sudo pacman -Sy net-tools
sudo pacman -Sy mailx
elif [[ ! -z $FEDORA_CMD ]]; then
sudo dnf update
sudo dnf install nmap
sudo dnf install net-tools
sudo dnf install mailx
elif [[ "$OS_var" == "Darwin" ]]; then
install_brew_osx
brew install nmap
brew install mailutils
else
echo "error cannot find distro..."
exit 1;
fi
clear
}
function install_brew_osx() 
{
echo "Now installing brew for OSX"
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
}
## Date:
server_ascii
distro_check
echo -e "\e[1;31mDate and Time:\e[0m" 
date
## OS Version:
echo -e "\e[1;31mOS Information:\e[0m"
uname -m -o -v -r -p
## Hostname:
echo -e "\e[1;31mSystem Hostname:\e[0m"
hostname
## Check connection to Google:
echo -e "\e[1;31m Internet Connection Status:\e[0m"
wget -q --tries=10 --timeout=20 --spider http://google.com
if [[ $? -eq 0 ]]; then
echo "Online"
else
echo "Offline"
fi
## Internal IP address
echo -e "\e[1;31mInternal IP:\e[0m"
ifconfig | sed -En 's/127.0.0.1//;s/.*inet (addr:)?(([0-9]*\.){3}[0-9]*).*/\2/p'
## External IP address:
echo -e "\e[1;31mExternal IP:\e[0m"
curl ifconfig.co
## NMAP to scan for open ports:
echo -e "\e[1;31mOpen Ports on System:\e[0m"
nmap -p- -T4 127.0.0.1
echo -e "\e[1;31mSystem Uptime/Current Users Logged In:\e[0m"
w
## Current RAM Usage:
echo -e "\e[1;31mRam Usage:\e[0m"
free -g
## Disk usage:
echo -e "\e[1;31mDisk Usage Info:\e[0m"
df -h
## Load Average across cores:
echo -e "\e[1;31m Load Average:\e[0m"
top -n 1 -b | grep "load average:" | awk '{print $10 $11 $12}'
## Output Results To Text File



