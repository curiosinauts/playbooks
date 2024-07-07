#!/bin/bash -e

# set -x

export ANSIBLE_STDOUT_CALLBACK=debug
export ANSIBLE_ROLES_PATH=./roles:../roles:~/.ansible/roles

echo
read -p "Enter vm instance ip address  [192.168.10.101]     : " ip_address

echo
read -p "Enter db name                 [testdb]            : " db_name

echo
read -p "Enter db user name            [admin]             : " user_name

echo
read -p "Enter db user password                            : " user_password

echo
read -p "Enter ansible_user            [debian]            : " ansible_user

echo
read -p "Enter postgresql version      [14]                : " postgresql_version


ip_address=${ip_address:-192.168.10.101}

db_name=${db_name:-testdb}

user_name=${user_name:-admin}

ansible_user=${ansible_user:-debian}

postgresql_version=${postgresql_version:-14} 

cat ./hosts.tpl > hosts
echo ${ip_address} >> hosts 

ansible-playbook -i hosts -K -e "db_name=${db_name} user_name=${user_name} user_password=${user_password} postgresql_version=${postgresql_version}" postgres.yml    

# --become-password-file sudo_password.txt

rm -f hosts