#!/bin/bash
wget https://as7abcard.com/
grep "<a href" index.html | cut -d "/" -f 3 | cut -d "'" -f 3 | cut -d '"' -f 1 | cut -d "<" -f 4 | sort -u  > url.txt
for x in $(cat url.txt) ; do host $x ; done | grep "has address" | cut -d " " -f 4 > ips.txt
nmap -sV -A -p- --script vuln -iL ips.txt -o nmap 





