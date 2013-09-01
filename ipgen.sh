#!/usr/bin/env bash
# Daniel Compton
# 08/2013
# Daniel Compton
# www.commonexploits.com
# contact@commexploits.com
# Twitter = @commonexploits
# Tested on Bactrack 5 & Kali Nessus version 4 & 5

# Script begins
#===============================================================================

VERSION="0.2" 

clear
echo ""
echo -e "\e[00;32m#############################################################\e[00m"
echo ""
echo -e "	IPGen $VERSION "
echo ""
echo -e "	Simple IP Address listing script"
echo ""
echo -e "\e[00;32m#############################################################\e[00m"
echo ""


#Dependency checking

#Check for tshark
which nmap>/dev/null
if [ $? -eq 0 ]
        then
                echo ""
else
                echo ""
       		echo -e "\e[01;31m[!]\e[00m Unable to find the required nmap program, install and try again"
        exit 1
fi

echo ""
echo -e "\e[1;31m----------------------------------------------------------------------\e[00m"
echo -e "\e[01;31m[?]\e[00m Enter the IP range i.e 10.10.10.0/24, 10.10.10.1-58"
echo -e "\e[1;31m----------------------------------------------------------------------\e[00m"
echo ""
read IPRANGE

echo ""
echo -e "\e[1;31m----------------------------------------------------------------------------\e[00m"
 echo -e "\e[01;31m[?]\e[00m Do you want to exclude any IP's i.e your IP/other testers."
echo -e "\e[1;31m----------------------------------------------------------------------------\e[00m"
echo "Press Enter to not exclude any, or enter IPs and press enter. i.e 192.168.1.1-4"
echo ""
OUTPUT=$(pwd)
read EXCLUDE
if [ -z $EXCLUDE ]
	then
		echo ""
		echo -e "\e[1;32m------------------------------------------------------------\e[00m"
		echo -e "\e[01;32m[+]\e[00m The following IPs are within your range."
		echo -e "\e[1;32m------------------------------------------------------------\e[00m"
		nmap -sL $IPRANGE -n | cut -d " " -f 5 |grep [0-9] |egrep -v '[[:digit:]]{1,3}\.[[:digit:]]{1,3}\.[[:digit:]]{1,3}\.255' | egrep -v '[[:digit:]]{1,3}\.[[:digit:]]{1,3}\.[[:digit:]]{1,3}\.0' |tee "$OUTPUT"/ips.txt
		echo -e "\e[1;32m---------------------------------------------------"
		echo ""
		echo -e "\e[01;32m[+]\e[00m The IPs have been saved to "$OUTPUT"/ips.txt"
		echo ""
	else
		echo ""
		echo -e "\e[1;32m------------------------------------------------------------\e[00m"
		echo -e "\e[01;32m[+]\e[00m The following IPs are within your range."
		echo -e "\e[1;32m------------------------------------------------------------\e[00m"
		nmap --exclude $EXCLUDE -sL $IPRANGE -n | cut -d " " -f 5 | grep [0-9] |egrep -v '[[:digit:]]{1,3}\.[[:digit:]]{1,3}\.[[:digit:]]{1,3}\.255' | egrep -v '[[:digit:]]{1,3}\.[[:digit:]]{1,3}\.[[:digit:]]{1,3}\.0' |tee "$OUTPUT"/ips.txt

		echo -e "\e[1;32m---------------------------------------------------"
		echo ""
		echo -e "\e[01;33m[-]\e[00m I have excluded the following IP's from the list"
		echo ""
		echo "$EXCLUDE"
		echo ""
		echo -e "\e[01;32m[+]\e[00mThe IPs have been saved to "$OUTPUT"/ips.txt"
                echo ""

fi
exit 0
