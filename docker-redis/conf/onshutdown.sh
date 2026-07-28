#!/bin/bash
read -r pid < /run/redis/redis-server.pid
kill "$pid"
while ps -p "$pid" >/dev/null; do 
  echo "$(date +%FT%T) ${EPOCHREALTIME} still running"
  read -r -u 1 -t 0.01
done
echo "$(date +%FT%T) stopped redis"
ps -ef
