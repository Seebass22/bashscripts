#!/bin/bash
zathura --fork *.pdf
sleep 0.1
nvim "$@"
