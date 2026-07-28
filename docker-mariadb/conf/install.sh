#!/bin/bash
apt-get update && apt-get -y upgrade
apt-get install -y mariadb-server
apt-get install -y apache2-utils redis-tools
