#!/bin/bash
source properties.cfg

trap onexit EXIT
onexit(){
  echo "exiting build"
  docker container stop "$name"
  echo
  docker container logs -n10 -f "$name"
  exit 0
}
$(dirname $0)/build-and-run.sh $name
docker container logs -f $name
