#!/bin/bash
ffmpeg -i "$1" -vf "transpose=clock" -crf 18 "$2"
