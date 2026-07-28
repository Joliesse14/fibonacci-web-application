#!/bin/bash
cp conf/haproxy-global-defaults-frontend.txt conf/haproxy.cfg
for i in {00001..10000}; do
	echo   "use_backend user-$i-backend if { path_beg /user-$i/ }"
done >> conf/haproxy.cfg

cat conf/haproxy-backends-default.txt >> conf/haproxy.cfg
for i in {00001..10000}; do 
	echo "backend user-$i-backend
  server user-$i-server apache"
done >> conf/haproxy.cfg
