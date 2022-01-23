#!/bin/bash
# packer build --var-file=variables-full.json ./immutable.json
packer build --var-file=variables.json ./app.json
packer build --var-file=variables.json ./db.json
