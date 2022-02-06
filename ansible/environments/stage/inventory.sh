#!/usr/bin/bash

set -euo pipefail
IFS=$'\n\t'

function dynamic_hosts() {
    app_hosts=$( \
        yc compute instance list --format json \
        | jq 'map(select(.labels.tags == "reddit-app"))
        | .[0].network_interfaces[0].primary_v4_address.one_to_one_nat.address'\
    )
    db_hosts=$( \
        yc compute instance list --format json \
        | jq 'map(select(.labels.tags == "reddit-db"))
        | .[0].network_interfaces[0].primary_v4_address.one_to_one_nat.address'\
    )
    list_hosts "$app_hosts" "$db_hosts"
}

function list_hosts() {
    printf '{
    "app": {
        "hosts": [%s]
    },
    "db": {
        "hosts": [%s]
    },
    "_meta": {
        "hostvars": {}
    }
}
' "$1" "$2"
}

case ${1-} in
    --list)
        dynamic_hosts;;
    *)
        echo "Usage: ./inventory.sh --list"
esac
