#!/bin/bash
# copy curently playing MPD song to current dir

path="$(mpc status -f %file% | head -n1)"
fullpath="/mnt/D/music/$path"
echo $fullpath
if [ -n "$path" ]; then
	cp "$fullpath" ./
fi
