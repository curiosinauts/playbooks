#!/bin/sh

cd /etc/nutcracker.d/ || return
/etc/nutcracker.d/generate-nutcracker-yml.sh
chown nutcracker:nutcracker nutcracker.yml

/usr/local/sbin/nutcracker -c /etc/nutcracker.d/nutcracker.yml 