#!/bin/bash -e

# set -x

export ANSIBLE_STDOUT_CALLBACK=debug
export ANSIBLE_ROLES_PATH=./roles:../roles:~/.ansible/roles

echo
read -p "Enter vm instance ip address  [192.168.0.130]     : " ip_address
echo
read -p "Enter ansible_user            [debian]            : " ansible_user

ip_address=${ip_address:-192.168.0.130}

ansible_user=${ansible_user:-debian}

cat ./hosts.tpl > hosts
echo ${ip_address} >> hosts 

ansible-playbook -i hosts -e "" loki.yml    

rm -f hosts

