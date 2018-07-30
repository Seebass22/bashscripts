#!/bin/bash
mkdir -p /tmp/i3screenshot/
args=$(i3-msg -t get_workspaces | sed -e 's/,{/\n/g' | cut -d : -f 2 | cut -d , -f 1 | tr '\n' ' ')
for ws in $args
do
	file=tmp$ws.png
	i3-msg workspace $ws
	sleep 0.2
	scrot /tmp/i3screenshot/$file
done

pushd /tmp/i3screenshot/
convert tmp*.png +append  result.png
rm tmp*.png
popd
mv /tmp/i3screenshot/result.png ./

