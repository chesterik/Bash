#!/bin/bash

echo -e "\n##########\n Total CPU usage \n##########"

top -bn1 | grep "Cpu" | awk '{print $2 + $4}'

echo -e "\n##########\n Total memory usage (Free vs Used including percentage) \n##########"

free -m | grep "Mem:" | awk '{printf "Used: %dMB / Total: %dMB (%.2f%%)\n", $3, $2, $3/$2*100}'

echo -e "\n##########\n Total disk usage (Free vs Used including percentage) \n##########"

df -h | grep "/dev/sda2" | awk '{printf "Used: %dGB / Total: %dGB (%.2f%%)\n", $2, $3, $3/$2*100}'

echo -e "\n##########\n Top 5 processes by CPU usage \n##########"

ps aux --sort=-%cpu | head -n 6 | awk '{print $1 "\t" $2 "\t" $4 "\t" $11}'

echo -e "\n##########\n Top 5 processes by memory usage \n##########"

ps aux --sort=-%mem | head -n 6 | awk '{print $1 "\t" $2 "\t" $4 "\t" $11}'
