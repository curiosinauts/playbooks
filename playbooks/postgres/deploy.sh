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

if [ "${1}" = "-h" ]; then
    usage
    exit 0
fi
echo
read -p "Enter target host            : " target
read -p "Enter db name                : " db_name
read -p "Enter db user name           : " user_name
read -p "Enter db user password       : " user_password
echo
read -p "Enter ansible_user [vagrant] : " ansible_user
ansible_user=${ansible_user:-vagrant}

ansible-playbook -e "target=${target} db_name=${db_name} user_name=${user_name} user_password=${user_password}" postgres.yml    