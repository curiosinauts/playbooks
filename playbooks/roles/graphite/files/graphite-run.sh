#!/bin/bash

set -x

rm -f /opt/graphite/storage/carbon-cache-a.pid
exec /usr/bin/python /opt/graphite/bin/carbon-cache.py start --debug 2>&1 >> /var/log/carbon.log &

rm -f /opt/graphite/storage/carbon-aggregator-a.pid
exec /usr/bin/python /opt/graphite/bin/carbon-aggregator.py start --debug 2>&1 >> /var/log/carbon-aggregator.log &

PYTHONPATH=/opt/graphite/webapp gunicorn wsgi --workers=4 --bind=0.0.0.0:8888 --log-file=/var/log/gunicorn.log --preload --pythonpath=/opt/graphite/webapp/graphite &
