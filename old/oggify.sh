#!/bin/bash
# convert audio file to mkv with opus codec - very tiny file size
[ $# -ne 1 ] || [[ ! $1 =~ .+\.+ ]] && exit
ffmpeg -i "$1" -c:a libopus -b:a 32k "${1%.*}.mkv"
