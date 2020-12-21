#!/bin/bash
echo "$(ip addr | grep -w inet | sed '/127.0.0.1/d' | head -n 1 | awk '{print $2}')"
