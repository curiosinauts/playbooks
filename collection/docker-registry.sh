#!/bin/bash -e

# set -x

export ANSIBLE_STDOUT_CALLBACK=debug
export ANSIBLE_ROLES_PATH=./roles:../roles

echo
read -p "Enter node ip address       [192.168.4.121]                 : " ip_address

echo
read -p "Enter host_url [https://docker-registry.curiosityworks.org] : " host_url

echo
read -p "Enter ansible_user          [debian]                        : " ansible_user

echo
read -p "Enter version               [2.8.0]                         : " version

ip_address=${ip_address:-192.168.4.121}
host_url=${host_url:-https://docker-registry.curiosityworks.org}
ansible_user=${ansible_user:-debian}
version=${version:-2.8.0}

cat ./hosts.tpl > hosts
echo "${ip_address}" >> hosts 

ansible-playbook -i hosts -e "host_url=${host_url} ansible_user=${ansible_user} version=${version}" docker-registry.yml    

rm -f hosts || true