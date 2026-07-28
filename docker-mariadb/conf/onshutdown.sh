#!/bin/bash
service mariadb stop
echo "$(date +%FT%T) stopped"
ps -ef
