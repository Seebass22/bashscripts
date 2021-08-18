#!/bin/bash
# scale video down to 1/2 size

[ $# -ne 2 ] && echo USAGE: $0 infile outfile && exit
ffmpeg -i "$1" -vf scale=iw/2:-1 "$2"
