#!/bin/bash

echo '  _________                                   ___ ___                .__   __  .__     
 /   _____/ ______________  __ ___________   /   |   \   ____ _____  |  |_/  |_|  |__  
 \_____  \_/ __ \_  __ \  \/ // __ \_  __ \ /    ~    \_/ __ \\__  \ |  |\   __\  |  \ 
 /        \  ___/|  | \/\   /\  ___/|  | \/ \    Y    /\  ___/ / __ \|  |_|  | |   Y  \
/_______  /\___  >__|    \_/  \___  >__|     \___|_  /  \___  >____  /____/__| |___|  /
        \/     \/                 \/               \/       \/     \/               \/ '

## Date:
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



