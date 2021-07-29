#!/bin/bash -e

if test -f /etc/consul.d/registry.tpl; then
    # create registry.json for consul agent
	cd /etc/consul.d/
	UUID=$(uuid)
	bind_addr=$(ip address | grep eth1 -A 1 | grep inet | awk '{ print $2 }' | cut -d '/' -f1)
	cat registry.tpl                          | \
	sed 's/__uuid__/'"${UUID}"'/g'            | \
	sed 's/__ip__/'"${bind_addr}"'/g'         | \
	sed 's/__port__/'"5000"'/g'                 \
	> registry.json    
	chown consul:consul registry.json
    # reload consul
    /usr/local/bin/consul reload
fi

# start docker registry
/usr/local/bin/registry serve /etc/docker/registry/config.yml
