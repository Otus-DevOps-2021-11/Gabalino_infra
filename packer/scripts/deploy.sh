#!/bin/bash

git clone -b monolith https://github.com/express42/reddit.git /opt/reddit && \
cd /opt/reddit && \
bundle install && \
gem install bundler:1.16.1 && \

#   make SystemUnit
echo "[Unit]
Description=Puma Service
After=network.target
[Service]
Type=simple
WorkingDirectory=/opt/reddit
ExecStart=/usr/local/bin/puma
PIDFile=/var/run/puma.pid
[Install]
WantedBy=multi-user.target" >> /lib/systemd/system/puma.service && \

chmod +x /lib/systemd/system/puma.service && \
systemctl daemon-reload && \
systemctl start puma && \
systemctl enable puma && \
echo "http://$(curl -s ipconfig.io):9292"
