#!/bin/bash
set -e
cd `dirname "$0"`
docker build -t tomsaleeba/alpine-cron-test:1 .
