#!/bin/bash
packer build --var-file=variables-full.json ./immutable.json
