#!/bin/bash

source properties.cfg
docker image build -t "image-$name" -f ../files/Dockerfile conf
docker container inspect "$name" &>/dev/null && {
  echo -n "Status: "
  docker container inspect -f '{{.State.Status}}' "$name"
  docker container rm -f "$name"
}

# shellcheck disable=SC2086
docker container create --network mynet --name "$name" $createextra --init "image-$name"
docker container cp ../files/myinit.sh "$name:/usr/bin/"
docker container cp conf/onstartup.sh "$name:/"
docker container cp conf/onshutdown.sh "$name:/"
[ -e bin/before-start.sh ] && bin/before-start.sh
docker container start "$name"
docker container inspect "$name" | jq -r '.[0].NetworkSettings.Networks.mynet.IPAddress'
[ -e bin/after-start.sh ] && bin/after-start.sh

