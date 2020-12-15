#!/bin/bash -e

cd /etc/consul.d/
UUID=$(uuid)
bind_addr=$(ip address | grep eth1 -A 1 | grep inet | awk '{ print $2 }' | cut -d '/' -f1)
cat prometheus.tpl                        | \
sed 's/__uuid__/'"${UUID}"'/g'            | \
sed 's/__ip__/'"${bind_addr}"'/g'         | \
sed 's/__port__/'"9090"'/g'                 \
> prometheus.json    
chown consul:consul prometheus.json