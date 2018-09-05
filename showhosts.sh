#!/bin/bash
nmap -v -sL 192.168.2.1/24 | awk '{print $5 $6}' | grep -v ^[0-9] | sed '1,4d' | head -n -1
