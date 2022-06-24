#!/bin/bash
ffmpeg -i "$1" -ss "$2" -to "$3" -c copy "$4"
