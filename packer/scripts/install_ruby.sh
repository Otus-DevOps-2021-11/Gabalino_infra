#!/bin/bash

export DEBIAN_FRONTEND=noninteractive
apt-get update -qy && \
while PID=$(pidof -s apt-get); do tail --pid=$PID -f /dev/null; done && \
apt-get install -qy ruby-full ruby-bundler build-essential apt-transport-https ca-certificates git && \
apt-get clean && \
ruby -v && \
bundler -v
