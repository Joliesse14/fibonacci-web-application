#!/bin/bash
service haproxy start
service syslog-ng start
echo "$(date +%FT%T) haproxy started"
curl -s http://127.0.0.1/direct
