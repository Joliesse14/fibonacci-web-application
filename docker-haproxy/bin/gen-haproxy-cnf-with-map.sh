#!/bin/bash
cp conf/haproxy-global-defaults-frontend.txt conf/haproxy.cfg
echo "  acl iscatch path -m beg /catch
  use_backend %[path,map_beg(/etc/haproxy/catch.map)] if iscatch
  # really hard: https://www.haproxy.com/documentation/haproxy-configuration-manual/2-8r1/ (Quoting and Escaping)
  #              and not even faster ...
  # use_backend '%[path,regsub(\"^/(/[^/]+/).*$\",\"\1\",g),map(/etc/haproxy/catch.map)]'
" >> conf/haproxy.cfg

cat conf/haproxy-backends-default.txt >> conf/haproxy.cfg

for i in {00001..10000}; do 
	echo "
backend catch-$i-backend
  http-request replace-path /catch-$i/(.*) /anon-$i/\1
  server catch-$i-server apache" 
done >> conf/haproxy.cfg

for i in {00001..10000}; do
	echo "/catch-$i/ catch-$i-backend"
done > conf/catch.map
