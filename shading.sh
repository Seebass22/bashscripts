#!/bin/bash
# set URxvt transparency via Xdefaults

if [ $# -ne 1 ]
then
	cat ~/.Xdefaults | grep shading
else
	sed -iE --follow-symlinks "s/URxvt.shading: [0-9]*/URxvt.shading: $1/" ~/.Xdefaults
	cat ~/.Xdefaults | grep shading
fi
