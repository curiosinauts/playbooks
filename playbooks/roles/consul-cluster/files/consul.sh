#!/bin/bash -xe

/usr/local/bin/consul agent -config-dir=/etc/consul.d -client 0.0.0.0 -bind '{{ GetInterfaceIP "eth1" }}'