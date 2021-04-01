#!/bin/bash
# print names of zips in Downloads dir
# or "no zips found"

cd ~/Downloads/
zips="$(fd -d 1 | grep '.zip$')"
if [ ! "$zips" == '' ]; then
	echo "$zips"
else
	echo "No zips found"
fi
