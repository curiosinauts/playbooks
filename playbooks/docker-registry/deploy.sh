#!/bin/bash -e

# set -x

usage() {
  echo -e "Usage   : deloy.sh <hosts>"  
  echo
  echo -e 'Example : deloy.sh docker_registry"'
  echo
}

export ANSIBLE_STDOUT_CALLBACK=debug
export ANSIBLE_ROLES_PATH=./roles:../roles

if [ "${1}" = "" ]; then
    usage
    exit 0
fi
echo
read -p "Enter host_url (e.g. https://docker-registry.example.com): " host_url
echo
read -p "Enter consul node1 hostname: " consul_node1
read -p "Enter consul node2 hostname: " consul_node2
read -p "Enter consul node3 hostname: " consul_node3
echo
read -p "Enter ansible_user [vagrant]: " ansible_user
ansible_user=${ansible_user:-vagrant}

ansible-playbook -e "target_hosts=${1} host_url=${host_url} ansible_user=${ansible_user} consul_node1=${consul_node1} consul_node2=${consul_node2} consul_node3=${consul_node3}" docker-registry.yml    