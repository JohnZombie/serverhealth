#!/bin/bash


date

echo"========================================"


#The date command is used to show the systems time and date information.


uptime


echo "========================================"

#The uptime command gives a one line display of the following information.

   # The current time example:(21:54:11)
    #How long the system has been running example: (up 13 days)
    #How many users are currently logged on example: (1 user)
    #The system load averages for the past 1, 5, and 15 minutes example: (0.21, 0.21, 0.12)



echo "It is connected:"

w

#The w command provides a quick summary of every user logged on this server along with load activites.


echo "========================================="

echo "Last Logins:"

last -a |head -3

#last shows displays a list of all users logged in (and out) since /var/log/wtmp file was created. the -a switch Displays the hostname in the last column. Useful in combination with the next flag. 

#The head command reads the first few lines of any text given to it as an input and writes them to standard output (which, by default, is the display screen). The -3 switch just specifys the first 3 lines.

echo "=========================================="

echo "Disk and Memory Usage:"

df -h  


echo "=========================================="

egrep --color 'Mem|Cache|Swap' /proc/meminfo

echo "=========================================="


cat /var/log/messages 

echo "=========================================="

 echo "Utilization and most important processes:"
    
top -b |head -3
   
echo "=========================================="
    
top -b |head -10 |tail -4
    
echo "=========================================="
    
echo " Info on open TCP ports......"
    
nmap -p- -T4 127.0.0.1
    
echo "=========================================="
    
echo "Current connections:"
   
 ss -s
    
echo "==========================================="
    
echo "processes:"
    
ps auxf --width=200
    
echo "==========================================="
    
echo "vmstat info:"

vmstat 1 5
