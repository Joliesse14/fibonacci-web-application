#!/bin/bash
source properties.cfg
docker cp conf/ubuntu.sh "$name:/"
docker container exec -i --user ubuntu "$name" /ubuntu.sh >/dev/null
docker container exec -i --user ubuntu "$name" tee /home/ubuntu/.ssh/authorized_keys < ~/.ssh/id_ed25519.pub

ssh-keygen -f ~/.ssh/known_hosts -R "$ip"
ssh-keyscan -t ed25519 "$ip" >> ~/.ssh/known_hosts
ssh ubuntu@"$ip" 'echo "i am $(whoami) on $(hostname -I)"'
docker container exec "$name" bash -c "apt-get install -y pv"

scp conf/k6-example.js ubuntu@"$ip":
scp conf/install-playwright.sh ubuntu@"$ip":
