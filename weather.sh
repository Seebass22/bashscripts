#!/bin/bash
if [ -n "$1" ] && [ $1 != "temp" ]; then
	city="$1"
else
	city='Berlin'
fi

update=0
if [ ! -f /tmp/weather${city} ] || [ "$(( $(date +"%s") - $(stat -c "%Y" /tmp/weather${city}) ))" -gt "7200" ]
then
	update=1
fi

if [ $update -eq 1 ] ; then
	curl -s wttr.in/$city > /tmp/weather${city}
fi


if [ $1 = "temp" ] || [ $2 = "temp" ]; then
	echo "$city: $(cat /tmp/weather${city} | grep ° | head -n 1 | awk '{print $(NF - 1) $NF}' | sed "s,\x1B\[[0-9;]*[a-zA-Z],,g")"
else
	cat /tmp/weather${city}
fi
