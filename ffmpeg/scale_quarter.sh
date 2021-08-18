#!/bin/bash
# scale video down to 1/4 size

[ $# -ne 2 ] && echo USAGE: $0 infile outfile && exit
ffmpeg -i "$1" -vf scale=iw/4:-1 "$2"
