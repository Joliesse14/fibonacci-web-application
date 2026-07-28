#!/bin/bash
#echo show map /etc/haproxy/catch.map | socat stdio /run/haproxy/admin.sock
ncat -U /var/run/haproxy/admin.sock <<<"show map /etc/haproxy/catch.map"
