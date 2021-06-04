#!/bin/bash -e

# set -x

usage() {
  echo -e "Usage   : deloy.sh <hosts>"  
  echo
  echo -e 'Example : deloy.sh nomad_cluster"'
  echo
}

export ANSIBLE_STDOUT_CALLBACK=debug
export ANSIBLE_ROLES_PATH=./roles:../roles

if [ "${1}" = "" ]; then
    usage
    exit 0
fi
echo
read -p "Enter consul node1 hostname: " consul_node1
read -p "Enter consul node2 hostname: " consul_node2
read -p "Enter consul node3 hostname: " consul_node3
consul_node1=${consul_node1:-tmt-vm1.7onetella.net}
consul_node2=${consul_node2:-tmt-vm2.7onetella.net}
consul_node3=${consul_node3:-tmt-vm3.7onetella.net}
echo
read -p "Enter nomad node1 hostname: " node1
read -p "Enter nomad node2 hostname: " node2
read -p "Enter nomad node3 hostname: " node3
node1=${node1:-tmt-vm4.7onetella.net}
node2=${node2:-tmt-vm5.7onetella.net}
node3=${node3:-tmt-vm6.7onetella.net}
echo
read -p "Enter ansible_user [vagrant]: " ansible_user
ansible_user=${ansible_user:-vagrant}

ansible-playbook -e "target_hosts=${1} ansible_user=${ansible_user} consul_node1=${consul_node1} consul_node2=${consul_node2} consul_node3=${consul_node3} node1=${node1} node2=${node2} node3=${node3}" nomad-cluster.yml    