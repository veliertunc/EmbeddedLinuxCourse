#!/usr/bin/bash
sleep 300 &
lab_pid=$!
printf 'Lab process PID = %s\n' "$lab_pid"

ps -p "$lab_pid" -o pid,comm

kill "$lab_pid"
wait "$lab_pid"
ps -p "$lab_pid" -o pid,comm