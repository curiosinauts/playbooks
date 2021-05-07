#!/bin/sh

/usr/local/bin/consul agent -config-dir=/etc/consul.d -client 127.0.0.1 -bind '{{ GetInterfaceIP "eth1" }}'