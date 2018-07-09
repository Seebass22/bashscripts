#!/bin/bash

sessions=$(lsof -Pi | grep ssh | wc -l)
nr=$(lsof -Pi | grep ssh | cut -d ">" -f 2 | cut -d ":" -f 1 | sort | uniq -c | wc -l)

if [ $sessions -eq 0 ] ; then
	echo ""	
else
	if [ $nr -lt 4 ] ; then
		for i in $(seq 1 $nr)
		do
			devices+=$(lsof -Pi | grep ssh | cut -d ">" -f 2 | cut -d ":" -f 1 | uniq -c | sed -n "$i p" | sed 's/^[[:blank:]]*//')
			if [ $i -ne $nr ] ; then
				devices+=", "
			fi
		done
	fi
	echo "ssh sessions: $devices"
fi
