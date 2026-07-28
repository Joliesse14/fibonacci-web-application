#!/bin/bash
usermod -aG www-data ubuntu
service ssh start
echo "$(date +%FT%T) openssh started"
