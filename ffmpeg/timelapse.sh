#!/bin/bash
[ $# -lt 2 ] && echo USAGE: $0 infile outfile [-t speed-multiplier] && exit
speed=64

POSITIONAL=()
while [[ $# -gt 0 ]]; do
	key="$1"

	case $key in
		-t|--speed)
			speed="$2"
			shift # past argument
			shift # past value
			;;
		*)    # unknown option
			POSITIONAL+=("$1") # save it in an array for later
			shift # past argument
			;;
	esac
done

input="${POSITIONAL[0]}"
output="${POSITIONAL[1]}"
ffmpeg -i "$input" -r 60 -filter:v "setpts=(1/$speed)*PTS" -vcodec libx264 -an -crf 18 "$output"
