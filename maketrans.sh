#!/bin/bash
sed -i 's/^URxvt.transparent: false/!URxvt.transparent: false/' ~/.Xdefaults
sed -i 's/^!URxvt.transparent: true/URxvt.transparent: true/' ~/.Xdefaults
