#!/bin/bash
set -e
APP_DIR=${1:-$HOME}
export DEBIAN_FRONTEND=noninteractive
sudo apt-get -qq update && \
while PID=$(pidof -s apt-get); do tail --pid=$PID -f /dev/null; done && \
sudo apt-get -qq install -y git && \
git clone -b monolith https://github.com/express42/reddit.git $APP_DIR/reddit && \
cd $APP_DIR/reddit && \
bundle install && \
sudo mv /tmp/puma.service /etc/systemd/system/puma.service && \
chmod +x /etc/systemd/system/puma.service && \
sudo systemctl daemon-reload && \
sudo systemctl start puma && \
sudo systemctl enable puma
