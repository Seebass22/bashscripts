#!/bin/bash
# concat reverse of video (no audio)

[ $# -ne 2 ] && echo USAGE: $0 infile outfile && exit
ffmpeg -i "$1" -filter_complex "[0:v]reverse,fifo[r];[0:v][r] concat=n=2:v=1 [v]" -map "[v]" "$2"
