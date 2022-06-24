#!/bin/bash
# create a 9:16 aspect ratio video with blurred sides
# defaults to 1080x1920 resolution
# scale and blur video to produce background

vertical=1920
horizontal=1080
[ $# -lt 2 ] && echo "USAGE: $0 infile outfile [-x horizontal_res -y vertical_res]" && exit

POSITIONAL=()
while [[ $# -gt 0 ]]; do
	key="$1"

	case $key in
		-x|--horizontal)
			horizontal="$2"
			shift # past argument
			shift # past value
			;;
		-y|--vertical)
			vertical="$2"
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

ffmpeg -i "$input" -filter_complex "[0:v]boxblur=40,scale=${horizontal}x${vertical},
	setsar=1[bg];[0:v]scale=${horizontal}:${vertical}:force_original_aspect_ratio=decrease[fg];\
	[bg][fg]overlay=y=(H-h)/2"\
	-c:a copy -crf 18 "$output"
