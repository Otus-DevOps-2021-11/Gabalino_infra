#!/bin/bash

export DEBIAN_FRONTEND=noninteractive
wget -qO - https://www.mongodb.org/static/pgp/server-4.4.asc | apt-key add - && \
echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/4.4 multiverse" | tee /etc/apt/sources.list.d/mongodb-org-4.4.list && \
apt-get update -qy && \
while PID=$(pidof -s apt-get); do tail --pid=$PID -f /dev/null; done && \
apt-get install -qy mongodb-org && \
apt-get clean && \
systemctl start mongod && \
systemctl enable mongod
