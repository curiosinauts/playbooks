#!/bin/sh

# Start Nomad in cluster mode
/usr/local/bin/nomad agent -config=/etc/nomad.d -bind '{{ GetInterfaceIP "eth1" }}'
