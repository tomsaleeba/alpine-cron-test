#!/bin/bash
set -e
docker run \
  --rm \
  -it \
  --name act \
  --env MANDATORY_ARG="supplied" \
  tomsaleeba/alpine-cron-test:1
