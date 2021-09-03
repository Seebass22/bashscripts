#!/bin/bash
# print total duration of video/audio files

if [ $# -eq 0 ]; then
	echo "USAGE: $0 <video-files>"
	exit 1
fi

durations=$(for f in "$@"; do
	ffprobe "$f" 2>&1 | grep Duration | awk '{print $2}' | sed 's/\..*$//'
done)

seconds=0
minutes=0
hours=0

for d in $durations; do
	sec=$(echo $d | cut -d ':' -f3 | sed 's/^0*//')
	min=$(echo $d | cut -d ':' -f2 | sed 's/^0*//')
	hour=$(echo $d | cut -d ':' -f1 | sed 's/^0*//')

	seconds=$((seconds + sec))
	minutes=$((minutes + min))
	hours=$((hours + hour))
done

minutes=$((minutes + (seconds / 60)))
seconds=$((seconds % 60))

hours=$((hours + (minutes / 60)))
minutes=$((minutes % 60))

echo "${hours}h ${minutes}m ${seconds}s"
