#!/bin/bash
# print total duration of video/audio files

if [ $# -eq 0 ]; then
	echo "USAGE: $0 [-r] <video-files>"
	exit 1
fi

if [ "$1" = "-r" ]; then
	files="$(find . | grep -E '(\.mp4$|\.mkv$|\.webm)')"
	durations=$(while IFS= read -r line; do
		ffprobe -v error -show_entries format=duration -sexagesimal -of default=noprint_wrappers=1:nokey=1 "$line" | cut -d '.' -f1
	done <<< "$files")
else
	durations=$(for f in "$@"; do
		ffprobe -v error -show_entries format=duration -sexagesimal -of default=noprint_wrappers=1:nokey=1 "$f" | cut -d '.' -f1
	done)
fi

seconds=0
minutes=0
hours=0

for d in $durations; do
	if [ "$d" = "N/A" ]; then
		continue
	fi
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
