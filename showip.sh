#!/bin/bash
echo "ip: $(ifconfig | grep "inet " | tail -n 1 | awk '{print $2}')"
