#!/bin/sh
set -eu

printf 'Kernel command line\n'
cat /proc/cmdline

printf '\nRoot filesystem in this environment\n'
awk '$2 == "/" { print "Source:", $1; print "Type:", $3 }' /proc/mounts

printf '\nProcess with PID 1\n'
cat /proc/1/comm
