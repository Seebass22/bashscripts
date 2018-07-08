#!/bin/bash

sessions=$(lsof -Pi | grep ssh | wc -l)

if [ $sessions -eq 0 ] ; then
	echo ""	
else
	if [ $sessions -lt 4 ] ; then
		for i in $(seq 1 $sessions)
		do
			devices+=$(lsof -Pi | grep ssh | cut -d ">" -f 2 | cut -d ":" -f 1 | sed -n "$i p")
			if [ $i -ne $sessions ] ; then
				devices+=", "
			fi
		done
	fi
	echo "ssh sessions: $sessions $devices"
fi
