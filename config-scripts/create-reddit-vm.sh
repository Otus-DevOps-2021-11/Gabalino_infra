#!/bin/bash
image_id=$(yc compute image get-latest-from-family reddit-full | grep ^id | awk '{print $2}') && \
yc compute instance delete --name reddit-app && \
yc compute instance create \
  --name reddit-app \
  --hostname reddit-app \
  --core-fraction 50 \
  --memory=2 \
  --create-boot-disk name=disk1,size=10,image-id=$image_id \
  --network-interface subnet-name=default-ru-central1-a,nat-ip-version=ipv4 \
  --metadata serial-port-enable=1 \
  --ssh-key ~/.ssh/appuser.pub
