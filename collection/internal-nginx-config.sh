#!/bin/bash -e

# set -x

export ANSIBLE_STDOUT_CALLBACK=debug
export ANSIBLE_ROLES_PATH=./roles:../roles

echo
read -p "Enter node ip address  [192.168.0.120]  : " ip_address
ip_address=${ip_address:-192.168.0.120}

echo
read -p "Enter ansible_user     [debian]         : " ansible_user
ansible_user=${ansible_user:-debian}

cat ./hosts.tpl > hosts
echo "${ip_address}" >> hosts 

ansible-playbook -i hosts -e "ansible_user=${ansible_user}" internal-nginx-config.yml    

rm -f hosts || true