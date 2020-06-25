#!/bin/sh

cd /etc/nutcracker.d/ || return

consul watch -type=service -service redis | \
jq '{ "nodes": [ .[] | if .Service.ID == "redis" then .Node.Address else empty end ]}' | \
gomplate -d node=stdin:///in.json -f nutcracker.yml.tpl > /etc/nutcracker.d/nutcracker.yml