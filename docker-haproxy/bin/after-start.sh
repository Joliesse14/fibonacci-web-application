#!/bin/bash
#docker container exec haproxy bash -c "apt install -y pv socat"
ip=$(docker container exec haproxy hostname -I)
ip=${ip// /}
for i in {1..500}; do
  if curl -s http://$ip/ >/dev/null; then break; fi
  echo "try $i"
  sleep 0.5
done
curl -I "http://${ip}/"
curl -I "http://${ip}/direct"

curl -I "http://${ip}/webapp/hello"
#curl -i "http://${ip}/lua"
