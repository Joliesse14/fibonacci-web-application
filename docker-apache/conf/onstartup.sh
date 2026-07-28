#!/bin/bash
sed -i 's_^ *# Global configuration.*_#&\nServerName apache2_g' /etc/apache2/apache2.conf

service apache2 start
echo "$(date +%FT%T) apache started"
