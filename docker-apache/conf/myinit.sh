#!/bin/bash

trap onexit EXIT
onexit(){
  echo "$(date +%FT%T) onexit"
  /onshutdown.sh
  exit 
}
/onstartup.sh
ip=$(hostname -I)
while true; do
  echo "$(date +%FT%T) $ip ping"
  read -r -u1 -t3
done
