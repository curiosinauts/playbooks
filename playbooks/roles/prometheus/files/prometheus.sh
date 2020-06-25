#!/bin/sh

/opt/prometheus/prometheus --config.file /etc/prometheus.d/prometheus.yml \
--storage.tsdb.path /opt/prometheus/data