#!/bin/bash
source properties.cfg
bin/gen-haproxy-cnf-with-map.sh
cp conf/haproxy-lua.cfg conf/haproxy.cfg
bin/gen-haproxy-cnf.sh
docker container cp conf/haproxy.cfg "$name:/etc/haproxy/"
docker container cp conf/catch.map "$name:/etc/haproxy/"
docker container cp conf/mylualib.lua "$name:/etc/haproxy/"
docker container cp conf/show-map.sh "$name:/usr/local/bin"

