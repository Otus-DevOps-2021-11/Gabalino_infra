#!/bin/bash

cd ~ && \
rm -rf reddit && \
git clone -b monolith https://github.com/express42/reddit.git && \
cd reddit && \
bundle install && \
sudo gem install bundler:1.16.1 && \
/usr/local/bin/puma -d && \
ps ax | grep puma && \
echo "http://$(curl -s ipconfig.io):9292"
