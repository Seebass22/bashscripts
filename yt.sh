#!/bin/bash
[ $# -eq 1 ] && setsid mpv -quiet "$1" > /dev/null 2>&1 &
