#!/bin/bash -e

vagrant cloud publish 7onetella/ubuntu-19.10 1.0.0 virtualbox output-vagrant/package.box -d "generic ubuntu 19.10 box" --version-description "19.10" --release --short-description "generic ubuntu 19.10 box"






playbook.yml roles

scp boxes/package.box vagrant@tmt:/home/vagrant/boxes/...

ssh tmt

vagrant box add 7onetella/ubuntu-19.10 url="file:///...."

vagrant up


build() {
    
    packer build ./ubuntu.json   
}

case $1 in
    build)
      build
      ;;
    *)
esac

vag host set tmt

vag host ssh tmt

vag instance ssh vm1

vag instance list

vag instance info vm1-consul

vag instance stop

vag instance start

vag instance describe 

vag box list

vag init 7onetella/ubuntu-19.10

vag box build