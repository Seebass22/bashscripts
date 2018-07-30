#!/bin/bash
mkdir -p /tmp/i3screenshot/
rm /tmp/i3screenshot/*
args=$(i3-msg -t get_workspaces | sed -e 's/,{/\n/g' | cut -d : -f 2 | cut -d , -f 1 | tr '\n' ' ')
for ws in $args
do
	file=${ws}tmp.png
	i3-msg workspace $ws
	sleep 0.2
	scrot /tmp/i3screenshot/$file
done

pushd /tmp/i3screenshot/
args=$(ls -l | awk '{print $9}' | sed 1d | sort -n | tr '\n' ' ')
convert $args +append  result.png
popd
mv /tmp/i3screenshot/result.png ./

