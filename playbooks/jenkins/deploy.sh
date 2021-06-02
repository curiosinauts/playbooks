#!/bin/bash -e

# set -x

usage() {
  echo -e "Usage   : deloy.sh"  
  echo
  echo -e 'Example : deloy.sh"'
  echo
}

export ANSIBLE_STDOUT_CALLBACK=debug
export ANSIBLE_ROLES_PATH=./roles:../roles:~/.ansible/roles

if [ "${1}" = "foo" ]; then
    usage
    exit 0
fi
echo
read -p "Enter vagrant nodename: " node_name
read -p "Enter jenkins hostname: " jenkins_host

read -p "Enter ansible_user [vagrant]: " ansible_user
ansible_user=${ansible_user:-vagrant}

ansible-playbook -e "target=${node_name} jenkins_host=${jenkins_host} ansible_user=${ansible_user}" jenkins.yml    