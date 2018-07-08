#!/bin/bash
city='Berlin'

curl -s wttr.in/$city > /tmp/weatherfile
echo "$city: $(cat /tmp/weatherfile | grep ° | head -n 1 | awk '{print $(NF - 1) $NF}' | sed "s,\x1B\[[0-9;]*[a-zA-Z],,g")"
