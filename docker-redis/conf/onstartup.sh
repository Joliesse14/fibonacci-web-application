#!/bin/bash
sed -i -e 's_^bind .*_bind 0.0.0.0_g' \
       -e "s_^# requirepass .*_requirepass foobared_g" \
/etc/redis/redis.conf

mkdir /run/redis/ && chown redis /run/redis/
sudo -u redis redis-server /etc/redis/redis.conf
echo "$(date +%FT%T) redis started"
