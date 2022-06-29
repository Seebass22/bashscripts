#!/bin/bash
[ $# -ne 2 ] && echo USAGE: $0 infile outfile && exit
speed=64
ffmpeg -i "$1" -r 60 -filter:v "setpts=(1/$speed)*PTS" -vcodec libx264 -an -crf 18 "$2"
