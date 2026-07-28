#!/bin/bash
apt install -y htop shellcheck jq psutils pwgen socat ncat nmap tcpdump 
apt install -y php-cli php-redis php-json php-mbstring php-xml php-mysql php-zip composer tcl
apt install -y openssh-server 
apt install -y git build-essential valgrind  openjdk-25-jdk cmake clang 
apt install -y python-is-python3 nodejs npm
apt install -y mariadb-client postgresql-client
apt install -y zbar-tools qrcode xmlstarlet xml2
apt install -y inotify-tools restic 
apt install -y imagemagick ghostscript gnuplot-nox gnupg gpg graphviz

# k6 start
K6_VERSION=$(curl -s "https://api.github.com/repos/grafana/k6/releases/latest" | grep -Po '"tag_name": "v\K[0-9.]+')
## intel/amd
downloadarch=amd64
## macos / raspberry
arch=$(uname -m)
if test "$arch" == aarch64; then downloadarch=arm64; fi
wget -qO k6.tar.gz https://github.com/grafana/k6/releases/latest/download/k6-v$K6_VERSION-linux-${downloadarch}.tar.gz
mkdir k6-temp
tar xf k6.tar.gz --strip-components=1 -C k6-temp
mv k6-temp/k6 /usr/local/bin
k6 --version
# k6 end
