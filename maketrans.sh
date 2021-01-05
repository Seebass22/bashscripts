#!/bin/bash
# set URxvt to be transparent (with last used value) via Xdefaults

sed -i --follow-symlinks 's/^URxvt.transparent: false/!URxvt.transparent: false/' ~/.Xdefaults
sed -i --follow-symlinks 's/^!URxvt.transparent: true/URxvt.transparent: true/' ~/.Xdefaults
