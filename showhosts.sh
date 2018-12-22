#!/bin/bash
ip='192.168.2.1/24'
if [ $# -eq 1 ]; then
	ip="$1"
fi
nmap -v -sL $ip | awk '{print $5 $6}' | grep -v ^[0-9] | sed '1,4d' | head -n -1
