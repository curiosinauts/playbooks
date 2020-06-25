#!/bin/sh

hostip=$(curl --connect-timeout 1 http://169.254.169.254/latest/meta-data/local-ipv4)

bindstr="-bind=${hostip}"
clientstr="-client=127.0.0.1"

/usr/local/bin/consul agent \
-config-dir=/etc/consul.d \
-join $(cat /etc/consul.d/consul_cluster) \
${bindstr} \
${clientstr}