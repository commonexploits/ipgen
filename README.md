IpGen
=====

Simple IP Address List Creator

This script is a simple front end for Nmap that will list out lists of IP addresses. 
It will also allow IPs to be excluded, also removes any addresses ending in x.x.x.0 or x.x.x.255.

This is handy for pen testers as you can generate your list of IPs, and easily exclude yourself, other testers or VMs from the scans. Then just feed this list into Nmap and also very handy to paste them into Nessus...How many people scan themselves? :)


============================================

Creates IP lists from ranges and allows exclusions

Developed by Daniel Compton at Info-Assure Ltd

https://github.com/commonexploits/ipgen.git


Installing  
=======================
    git clone https://github.com/commonexploits/ipgen.git


How To Use	
=======================
    ./ipgen.sh


Features	
=======================

* Lists out IP lists from subnets
* Allows IPs or ranges to be excluded


Requirements   
=======================
* Nmap

Tested on Backtrack 5 and Kali.


Screen Shot    
=======================
<img src="http://www.commonexploits.com/images/ipgen.png" alt="Screenshot" style="max-width:100%;">

<img src="http://www.commonexploits.com/images/ipgen2.png" alt="Screenshot" style="max-width:100%;">

<img src="http://www.commonexploits.com/images/ipgen3.png" alt="Screenshot" style="max-width:100%;">

Change Log
=======================

Version 0.2 - First release

** Will add exclustion list inputs soon.



