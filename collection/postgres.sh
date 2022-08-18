#!/bin/bash -e

# set -x

export ANSIBLE_STDOUT_CALLBACK=debug
export ANSIBLE_ROLES_PATH=./roles:../roles:~/.ansible/roles

echo
read -p "Enter vm instance ip address  [postgresdb]        : " ip_address
echo
read -p "Enter db name                 [curiosityworks]    : " db_name
echo
read -p "Enter db user name            [platformctl]       : " user_name
echo
read -p "Enter db user password                            : " user_password
echo
read -p "Enter ansible_user            [debian]            : " ansible_user
echo
read -p "Enter postgresql version      [11]                : " postgresql_version

ip_address=${ip_address:-postgresdb}

db_name=${db_name:-curiosityworks}

user_name=${user_name:-platformctl}

ansible_user=${ansible_user:-debian}

postgresql_version=${postgresql_version:-11} 

cat ./hosts.tpl > hosts
echo ${ip_address} >> hosts 

ansible-playbook -i hosts -e "db_name=${db_name} user_name=${user_name} user_password=${user_password} postgresql_version=${postgresql_version}" postgres.yml    

rm -f hosts