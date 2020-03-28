#!/bin/bash
newsboat -x reload
unread="$(newsboat -x print-unread | awk '{print $1}')"
echo $unread
[ "$unread" -ne 0 ] && notify-send "RSS: $unread unread posts"
