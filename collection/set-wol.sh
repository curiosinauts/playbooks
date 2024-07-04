#!/bin/bash -e

# set -x

export ANSIBLE_STDOUT_CALLBACK=debug
export ANSIBLE_ROLES_PATH=./roles:../roles

echo
read -p "Enter node ip address  [192.168.4.100]     : " ip_address
ip_address=${ip_address:-192.168.4.100}

echo
read -p "Enter ansible_user     [debian]            : " ansible_user
ansible_user=${ansible_user:-debian}

echo
read -p "Enter interface name   [eno1]              : " interface
interface=${interface:-eno1}

cat ./hosts.tpl > hosts
echo "${ip_address}" >> hosts 

ansible-playbook -i hosts -K -e "ansible_user=${ansible_user} interface=${interface}" set-wol.yml

rm -f hosts || true
