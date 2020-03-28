#!/bin/bash
# reload RSS feeds, send notification if updates found
newsboat -x reload
unread="$(newsboat -x print-unread | awk '{print $1}')"
echo $unread
[ "$unread" -ne 0 ] && notify-send "RSS: $unread unread posts"
