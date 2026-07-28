#!/bin/bash

sed -i 's_^bind-address.*_bind-address = 0.0.0.0_g' /etc/mysql/mariadb.conf.d/50-server.cnf

service mariadb start

sudo -u mysql mariadb -e "
create database \`vns-2025-e_db\`;
create user 'dbuser'@'%' identified by 'dbpassword';
grant all privileges on \`vns-2025-e_db\`.* to 'dbuser'@'%';
flush privileges;
use \`vns-2025-e_db\`;
create table Users(
    id int primary key auto_increment,
    name varchar(100) not null,
    email varchar(100) not null unique,
    password varchar(255) not null
);"
