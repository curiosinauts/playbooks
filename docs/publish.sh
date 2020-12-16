#!/bin/bash -e

vagrant cloud publish \
7onetella/ubuntu-19.10 \
1.0.0 \
virtualbox \
output-vagrant/package.box \
-d "generic ubuntu 19.10 box" \
--version-description "19.10" \
--release \
--short-description "generic ubuntu 19.10 box"