#!/bin/bash
# create 60fps video by interpolating frames (extremely slow)

[ $# -ne 2 ] && echo USAGE: $0 infile outfile && exit
ffmpeg -i "$1" -vf "minterpolate=fps=60:mi_mode=mci:mc_mode=aobmc:me_mode=bidir:vsbmc=1" -crf 18 "$2"
