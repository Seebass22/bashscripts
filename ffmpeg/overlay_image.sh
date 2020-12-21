#!/bin/bash
# overlay image

[ $# -ne 3 ] && echo USAGE: $0 video image outfile && exit
ffmpeg -i video.mp4 -i image.png -filter_complex "[0:v][1:v] overlay" output.mp4
