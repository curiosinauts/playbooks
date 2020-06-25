#!/bin/bash -e

set -x

box_name=$1

cd test/"${box_name}"

vagrant destroy -f

cd ../..

rm -rf boxes/7onetella/"${box_name}"

rm -rf ~/.vagrant.d/boxes/7onetella-VAGRANTSLASH-"${box_name}"/

packer build --force ./"${box_name}".json

cd test/"${box_name}"

vagrant up

vagrant ssh

cd ../..
