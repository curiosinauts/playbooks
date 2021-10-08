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
read -p "Enter vm instance ip address      : " ip_address
echo
read -p "Enter db name                     : " db_name
echo
read -p "Enter db user name                : " user_name
echo
read -p "Enter db user password            : " user_password
echo
read -p "Enter ansible_user       [debian] : " ansible_user
echo
read -p "Enter postgresql version [11]     : " postgresql_version

ansible_user=${ansible_user:-vagrant}
postgresql_version=${postgresql_version:-11} 

cat ./hosts.tpl > hosts
echo ${ip_address} >> hosts 

ansible-playbook -i hosts -e "db_name=${db_name} user_name=${user_name} user_password=${user_password} postgresql_version=${postgresql_version}" postgres.yml    