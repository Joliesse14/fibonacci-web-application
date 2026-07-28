#!/bin/bash
service syslog-ng stop
read -r pid < /var/run/haproxy.pid
# service does not seem to work
kill "$pid"
while ps -p "$pid" >/dev/null; do 
  echo "$(date +%FT%T) ${EPOCHREALTIME} still running"
  read -r -u 1 -t 0.1
done
echo "$(date +%FT%T) stopped haproxy"
ps -ef
