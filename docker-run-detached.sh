#!/bin/bash
set -e

trap "echo 'killing docker container'; docker rm -f act; exit;" SIGINT SIGTERM

docker run \
  --detach \
  --name act \
  --env MANDATORY_ARG="supplied" \
  tomsaleeba/alpine-cron-test:1
echo '[INFO] starting to tail logs...'
docker logs -f act
