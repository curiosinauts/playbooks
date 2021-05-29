#!/bin/bash -e

# set -x

usage() {
  echo -e "Usage   : deloy.sh <hosts>"  
  echo
  echo -e 'Example : deloy.sh gitea_host"'
  echo
}

export ANSIBLE_STDOUT_CALLBACK=debug
export ANSIBLE_ROLES_PATH=./roles:../roles:~/.ansible/roles

if [ "${1}" = "" ]; then
    usage
    exit 0
fi

echo
read -p "Enter server domain         : " server_domain
read -p "Enter git-ssh server domain : " git_ssh_server_domain
read -p "Enter secret key            : " secret_key
echo
read -p "Enter consul node1 hostname: " consul_node1
read -p "Enter consul node2 hostname: " consul_node2
read -p "Enter consul node3 hostname: " consul_node3
echo 
read -p "Enter ansible_user [vagrant]: " ansible_user
ansible_user=${ansible_user:-vagrant}

ansible-playbook -e "target_hosts=${1} ansible_user=${ansible_user} server_domain=${server_domain} git_ssh_server_domain=${git_ssh_server_domain} secret_key=${secret_key} consul_node1=${consul_node1} consul_node2=${consul_node2} consul_node3=${consul_node3}" gitea.yml    