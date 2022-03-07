#!/bin/bash -e

# start docker registry
/usr/local/bin/registry serve /etc/docker/registry/config.yml
