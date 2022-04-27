#!/bin/bash
# set volume of all firefox instances
# or just last instance
# to volume
function usage(){
	echo "USAGE: $0 [last] volume"
}

function get_args(){
	if [ $# -eq 0 ]; then
		usage
		exit
	elif [ $# -eq 1 ]; then
		percentage=$1
	else
		[ $1 = "last" ] && last=1
		percentage=$2
	fi
}

function set_volumes(){
	firefox_sinks="$(pactl list sink-inputs | grep -B17 'application.name = "Firefox"' | grep 'Sink Input' | awk '{print $3}' | cut -d '#' -f2)"
	[ $last -eq 1 ] && firefox_sinks="$(echo $firefox_sinks | awk '{print $NF}')"

	echo $firefox_sinks

	for sink in $firefox_sinks; do
		pactl set-sink-input-volume $sink ${percentage}%
	done
}

last=0
wait_time=3
get_args $@

while true; do
	echo -n "setting volume for sink input "
	set_volumes
	sleep $wait_time
done
