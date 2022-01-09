#!/bin/bash

sudo apt update -qq && \
sudo apt install -y ruby-full ruby-bundler build-essential apt-transport-https ca-certificates git && \
ruby -v && \
bundler -v
