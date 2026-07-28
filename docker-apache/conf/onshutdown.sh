#!/bin/bash
read -r pid < /run/apache2/apache2.pid
service apache2 stop
while ps -p "$pid" >/dev/null; do 
  echo "$(date +%FT%T) ${EPOCHREALTIME} still running"
  read -r -u 1 -t 0.01
done
echo "$(date +%FT%T) stopped apache"
ps -ef
