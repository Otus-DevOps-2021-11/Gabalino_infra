#!/bin/bash

sudo apt-get update -qq && \
sudo apt-get install -y ruby-full ruby-bundler build-essential apt-transport-https ca-certificates git && \
ruby -v && \
bundler -v
