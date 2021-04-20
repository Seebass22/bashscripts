#!/bin/bash
ip='192.168.2.1/24'
if [ $# -eq 1 ]; then
	ip="$1"
fi
nmap -sn $ip | grep 'report\|done'
