pid=$(pgrep stalonetray)
kill $pid
stalonetray & disown
