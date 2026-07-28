#!/bin/bash
cp conf/haproxy-global-defaults-frontend-lua.txt conf/haproxy.cfg
cat conf/haproxy-backends-default.txt >> conf/haproxy.cfg
