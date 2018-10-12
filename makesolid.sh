#!/bin/bash
sed -i --follow-symlinks 's/^URxvt.transparent: true/!URxvt.transparent: true/' ~/.Xdefaults
sed -i --follow-symlinks 's/^!URxvt.transparent: false/URxvt.transparent: false/' ~/.Xdefaults
