#!/bin/bash
echo "$(ifconfig | grep -w inet | head -n 1 | awk '{print $2}')"
