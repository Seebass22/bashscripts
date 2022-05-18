#!/bin/bash
# scale video down to 3/4 X and Y resolution

[ $# -ne 2 ] && echo USAGE: $0 infile outfile && exit
ffmpeg -i "$1" -vf scale=iw*0.75:-1 "$2"
