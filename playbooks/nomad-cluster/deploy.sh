#!/bin/bash -e

# set -x

usage() {
  echo -e "Usage   : deloy.sh <hosts>"  
  echo
  echo -e 'Example : deloy.sh nomad_cluster"'
  echo
}

export ANSIBLE_STDOUT_CALLBACK=debug

if [ "${1}" = "" ]; then
    usage
    exit 0
fi
echo
read -p "Enter consul node1 hostname: " consul_node1
read -p "Enter consul node2 hostname: " consul_node2
read -p "Enter consul node3 hostname: " consul_node3
echo
read -p "Enter nomad node1 hostname: " node1
read -p "Enter nomad node2 hostname: " node2
read -p "Enter nomad node3 hostname: " node3
echo
read -p "Enter ansible_user [vagrant]: " ansible_user
ansible_user=${ansible_user:-vagrant}

ansible-playbook -e "target_hosts=${1} ansible_user=${ansible_user} consul_node1=${consul_node1} consul_node2=${consul_node2} consul_node3=${consul_node3} node1=${node1} node2=${node2} node3=${node3}" nomad-cluster.yml    