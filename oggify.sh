#!/bin/bash
[ $# -ne 1 ] || [[ ! $1 =~ .+\.+ ]] && exit
ffmpeg -i "$1" -c:a libopus -b:a 32k "${1%.*}.mkv"
