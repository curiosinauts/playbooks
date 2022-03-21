#!/bin/bash -e

# set -x

host_default=$1
filename=$2

export ANSIBLE_STDOUT_CALLBACK=debug
export ANSIBLE_ROLES_PATH=./roles:../roles

read -p "Enter node ip address  [${host_default}] : " ip_address
ip_address=${ip_address:-$host_default}

echo
read -p "Enter ansible_user     [debian]        : " ansible_user
ansible_user=${ansible_user:-debian}

cat ./hosts.tpl > hosts
echo "${ip_address}" >> hosts 

ansible-playbook -i hosts -e "ansible_user=${ansible_user}" ${filename}.yml