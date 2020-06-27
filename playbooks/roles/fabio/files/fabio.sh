#!/bin/sh
# shellcheck disable=SC2037

# get fabio binding address
bind_addr=$(ip address | grep eth1 -A 1 | grep inet | awk '{ print $2 }' | cut -d'/' -f1)

# start fabio
/usr/local/bin/fabio \
--proxy.addr "${bind_addr}:80;rt=3s" \
--ui.addr "${bind_addr}:9998" \
--registry.consul.register.addr "${bind_addr}:9998" \
--tracing.SpanHost "${bind_addr}:9998"