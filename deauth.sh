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

echo "A window will open shortly showing a list of APs nearby. When you have found the MAC you want, close the window."
sleep 5
xterm -e airodump-ng wlan1
