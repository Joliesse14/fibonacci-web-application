#!/bin/bash
docker container exec -ti apache bash -c 'for i in {1..10}; do ab -c 50 -k -n10000 http://apache/enqueue.php 2>&1 |grep Requests; done'
