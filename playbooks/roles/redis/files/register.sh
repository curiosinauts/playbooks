#!/bin/bash -e

name=$1

cd /etc/consul.d/
UUID=$(uuid)
bind_addr=$(ip address | grep eth1 -A 1 | grep inet | awk '{ print $2 }' | cut -d '/' -f1)
cat ${name}.tpl                           | \
sed 's/__uuid__/'"${UUID}"'/g'            | \
sed 's/__ip__/'"${bind_addr}"'/g'         | \
sed 's/__port__/'"6379"'/g'                 \
> ${name}.json    
chown consul:consul ${name}.json

# /usr/local/bin/consul reload
