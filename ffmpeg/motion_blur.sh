#!/bin/bash
# add motion blur, create 60fps video

[ $# -ne 2 ] && echo USAGE: $0 infile outfile && exit
ffmpeg -i "$1" -filter:v tblend -r 60 -crf 18 "$2"
